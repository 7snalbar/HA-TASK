//
//  TrackerService.swift
//  HA-TASK
//
//  Created by Hasan Armoush on 12/08/2022.
//  Copyright © 2022 Hasan Armoush. All rights reserved.
//

import Foundation

enum TrackEventType {
    case listView
}

protocol TrackerType {
    func log(type: TrackEventType)
}

final class TrackerService: TrackerType {
    
    func log(type: TrackEventType) {
        // do something
    }
}
