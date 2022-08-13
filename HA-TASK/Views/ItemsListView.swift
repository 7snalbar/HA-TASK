//
//  ItemsListView.swift
//  HA-TASK
//
//  Created by Hasan Armoush on 12/08/2022.
//  Copyright © 2022 Hasan Armoush. All rights reserved.
//

import SwiftUI

struct ItemsListView : View {
    @ObservedObject var viewModel: ListViewModel
    var body: some View {
        NavigationView {
            List(viewModel.items) { item in
                ListRow(item: item)
            }
            .alert(isPresented: $viewModel.isErrorShown, content: { () -> Alert in
                Alert(title: Text("Error"), message: Text(viewModel.errorMessage))
            })
            .navigationBarTitle(Text("Items"))
        }
        .onAppear(perform: { self.viewModel.apply(.onAppear) })
    }
}

#if DEBUG
struct ItemsListView_Previews : PreviewProvider {
    static var previews: some View {
        ItemsListView(viewModel: .init())
    }
}
#endif
