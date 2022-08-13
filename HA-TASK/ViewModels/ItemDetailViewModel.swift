//
//  ItemDetailViewModel.swift
//  HA-TASK
//
//  Created by Hasan Armoush on 12/08/2022.
//  Copyright © 2022 Hasan Armoush. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class ItemDetailViewModel: ObservableObject {
    let objectWillChange: AnyPublisher<ListViewModel, Never>
    let objectWillChangeSubject = PassthroughSubject<ListViewModel, Never>()
    
    let item: Item
    
    init(item: Item) {
        objectWillChange = objectWillChangeSubject.eraseToAnyPublisher()
        self.item = item
    }
}
