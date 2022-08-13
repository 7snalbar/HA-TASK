//
//  ListRow.swift
//  HA-TASK
//
//  Created by Hasan Armoush on 12/08/2022.
//  Copyright © 2022 Hasan Armoush. All rights reserved.
//

import Foundation
import SwiftUI

struct ListRow: View {
    
    @State var item: Item
    var body: some View {
        let uppercasedName = item.name.capitalizingFirstLetter()
        NavigationLink(destination: ItemDetailView(viewModel: .init(item: item))) {
            Text(uppercasedName)
        }
    }
}

#if DEBUG
struct ListRow_Previews : PreviewProvider {
    static var previews: some View {
        ListRow(
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
    }
}
#endif
