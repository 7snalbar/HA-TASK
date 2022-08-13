//
//  ItemDetailView.swift
//  HA-TASK
//
//  Created by Hasan Armoush on 12/08/2022.
//  Copyright © 2022 Hasan Armoush. All rights reserved.
//

import Foundation
import SwiftUI

struct ItemDetailView: View {
    @ObservedObject var viewModel: ItemDetailViewModel
    @State var image: UIImage = UIImage()
    var body: some View {
        let uppercasedName = viewModel.item.name.capitalizingFirstLetter()
        VStack(alignment: .leading, spacing: 10) {
            Text(uppercasedName)
            if #available(iOS 15.0, *) {
                AsyncImage(url: URL(string: viewModel.item.imageUrlsThumbnails.first!))
            }
            
        }
        
    }
}

#if DEBUG
struct ItemDetailView_Previews : PreviewProvider {
    static var previews: some View {
        ItemDetailView(viewModel: .init(
            item: Item(
                uid:                    "uid uid uid ",
                price:                  "Price",
                name:                   "Name",
                imageIds:               ["1"],
                imageUrls:              ["https://via.placeholder.com/600/d32776"],
                imageUrlsThumbnails:    ["https://via.placeholder.com/150/d32776"],
                createdAt:              "12/12/2019 09:10:22"
            )
        )
        )
    }
}
#endif
