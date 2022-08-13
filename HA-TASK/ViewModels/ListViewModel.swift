//
//  ListViewModel.swift
//  HA-TASK
//
//  Created by Hasan Armoush on 12/08/2022.
//

import Foundation
import SwiftUI
import Combine

final class ListViewModel: ObservableObject, UnidirectionalDataFlowType {
    typealias InputType = Input
    
    private var cancellables: [AnyCancellable] = []
    
    // MARK: Input
    enum Input {
        case onAppear
    }
    func apply(_ input: Input) {
        switch input {
        case .onAppear: onAppearSubject.send(())
        }
    }
    private let onAppearSubject = PassthroughSubject<Void, Never>()
    
    // MARK: Output
    @Published private(set) var items: [Item] = []
    @Published var isErrorShown = false
    @Published var errorMessage = ""
    @Published private(set) var shouldShowIcon = false
    
    private let responseSubject = PassthroughSubject<ResultsResponse, Never>()
    private let errorSubject = PassthroughSubject<APIServiceError, Never>()
    private let trackingSubject = PassthroughSubject<TrackEventType, Never>()
    
    private let apiService: APIServiceType
    private let trackerService: TrackerType
    init(apiService: APIServiceType = APIService(),
         trackerService: TrackerType = TrackerService()) {
        self.apiService = apiService
        self.trackerService = trackerService
        
        bindInputs()
        bindOutputs()
    }
    
    private func bindInputs() {
        let request = ItemsRequest()
        let responsePublisher = onAppearSubject
            .flatMap { [apiService] _ in
                apiService.response(from: request)
                    .catch { [weak self] error -> Empty<ResultsResponse, Never> in
                        self?.errorSubject.send(error)
                        return .init()
                    }
            }
        
        let responseStream = responsePublisher
            .share()
            .subscribe(responseSubject)
        
        let trackingSubjectStream = trackingSubject
            .sink(receiveValue: trackerService.log)
        
        let trackingStream = onAppearSubject
            .map { .listView }
            .subscribe(trackingSubject)
        
        cancellables += [
            responseStream,
            trackingSubjectStream,
            trackingStream,
        ]
    }
    
    private func bindOutputs() {
        let itemsStream = responseSubject
            .map { $0.results }
            .assign(to: \.items, on: self)
        
        let errorMessageStream = errorSubject
            .map { error -> String in
                switch error {
                case .responseError: return "network error"
                case .parseError: return "parse error"
                }
            }
            .assign(to: \.errorMessage, on: self)
        
        let errorStream = errorSubject
            .map { _ in true }
            .assign(to: \.isErrorShown, on: self)
        
        cancellables += [
            itemsStream,
            errorStream,
            errorMessageStream,
        ]
    }
}
