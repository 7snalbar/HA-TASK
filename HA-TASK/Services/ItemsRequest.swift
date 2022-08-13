//
//  ItemsRequest.swift
//  HA-TASK
//
//  Created by Hasan Armoush on 12/08/2022.
//  Copyright © 2022 Hasan Armoush. All rights reserved.
//

import Foundation

struct ItemsRequest: APIRequestType {
    typealias Response = ResultsResponse
    
    var path: String = "/default/dynamodb-writer?"
    var queryItems: [URLQueryItem]? {
        return [
            
        ]
    }
}
