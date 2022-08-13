//
//  AnySubscription.swift
//  HA-TASK
//
//  Created by Hasan Armoush on 12/08/2022.
//  Copyright © 2022 Hasan Armoush. All rights reserved.
//

import Foundation
import Combine

final class AnySubscription: Subscription {
    
    private let cancellable: AnyCancellable
    
    init(_ cancel: @escaping () -> Void) {
        self.cancellable = AnyCancellable(cancel)
    }
    
    func request(_ demand: Subscribers.Demand) {}
    
    func cancel() {
        cancellable.cancel()
    }
    
}
