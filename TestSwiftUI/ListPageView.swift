//
//  ListPageView.swift
//  TestSwiftUI
//
//  Created by PhamHai Dang on 03/11/2023.
//

import SwiftUI

struct ListPageView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(groupPages.group, id: \.self){ group in
                    Section {
                        ForEach(group.pages, id: \.self) { page in
                            NavigationLink(destination: getDestination(pageId: page.id, groupID: group.id)){
                                Text(page.name)
                            }
                        }
                    } header: {
                        Text(group.name)
                    }
                }
            }.navigationTitle("More")
                .navigationBarTitleDisplayMode(.automatic)
        }
    }
    func getDestination(pageId: Int,groupID: Int) ->some View {
        switch (groupID,pageId){
        case (0,0): return HomeView()
        case (0,1): return HomeView()
        case (1,0): return HomeView()
        case (1,1): return HomeView()
        case (1,2): return HomeView()
        case (1,3): return HomeView()
        default:
            return HomeView()
        }
    }
}

struct ListPageView_Previews: PreviewProvider {
    static var previews: some View {
        ListPageView()
    }
}
