//
//  Item.swift
//  HA-TASK
//
//  Created by Hasan Armoush on 12/08/2022.
//  Copyright © 2022 Hasan Armoush. All rights reserved.
//

import Foundation
import SwiftUI

struct Item: Decodable, Identifiable, Hashable {
    
    var id: String { uid }
    var uid: String
    var price: String
    var name: String
    var imageIds: [String]
    var imageUrls: [String]
    var imageUrlsThumbnails: [String]
    var createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case uid = "uid"
        case price = "price"
        case name = "name"
        case createdAt = "created_at"
        case imageIds = "image_ids"
        case imageUrls = "image_urls"
        case imageUrlsThumbnails = "image_urls_thumbnails"
        
    }
    
}
