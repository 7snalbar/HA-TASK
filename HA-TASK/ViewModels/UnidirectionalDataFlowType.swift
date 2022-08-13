//
//  UnidirectionalDataFlowType.swift
//  HA-TASK
//
//  Created by Hasan Armoush on 12/08/2022.
//  Copyright © 2022 Hasan Armoush. All rights reserved.
//

import Foundation

protocol UnidirectionalDataFlowType {
    associatedtype InputType
    
    func apply(_ input: InputType)
}
