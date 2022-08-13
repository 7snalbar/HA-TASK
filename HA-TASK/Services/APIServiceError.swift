//
//  APIServiceError.swift
//  HA-TASK
//
//  Created by Hasan Armoush on 12/08/2022.
//  Copyright © 2022 Hasan Armoush. All rights reserved.
//

import Foundation

enum APIServiceError: Error {
    case responseError
    case parseError(Error)
}
