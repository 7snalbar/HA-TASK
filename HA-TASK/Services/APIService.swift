//
//  APIService.swift
//  HA-TASK
//
//  Created by Hasan Armoush on 12/08/2022.
//  Copyright © 2022 Hasan Armoush. All rights reserved.
//

import Foundation
import Combine

protocol APIRequestType {
    associatedtype Response: Decodable
    
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
}

protocol APIServiceType {
    func response<Request>(from request: Request) -> AnyPublisher<ResultsResponse, APIServiceError> where Request: APIRequestType
}

final class APIService: APIServiceType {
    init(api: URL = URL(string: "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com")!) {
        self.api = api
    }
    
    private let api: URL
    
    func response<Request>(from request: Request) -> AnyPublisher<ResultsResponse, APIServiceError> where Request: APIRequestType {
        
        let pathURL = URL(string: request.path, relativeTo: api)!
        
        let urlComponents = URLComponents(url: pathURL, resolvingAgainstBaseURL: true)!
        var request = URLRequest(url: urlComponents.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let decorder = JSONDecoder()
        let response = URLSession.shared.dataTaskPublisher(for: request)
            .map { data, urlResponse in data }
            .mapError { _ in APIServiceError.responseError }
            .decode(type: ResultsResponse.self, decoder: decorder)
            .mapError(APIServiceError.parseError)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
        
        return response
    }
}
