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
                            NavigationLink(destination: getDestination(pageId: page.pageType, groupID: group.groupType)){
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

    func getDestination(pageId: Navigationpage,groupID: NavigationGroup) ->some View {
        switch (groupID,pageId){
        case (.navigationApp,.story): return AnyView(HomeView())
        case (.navigationApp,.datePlanner): return AnyView(FavoriteView())
        case (.presentingApp,.grids): return AnyView(StoryView())
        case (.presentingApp,.editGrid): return AnyView(FunFactView())
        case (.presentingApp,.imageGallary): return AnyView(HomeView())
        case (.presentingApp,.layoutView): return AnyView(HomeView())
        default:
            return AnyView(HomeView())
        }
    }
}

struct ListPageView_Previews: PreviewProvider {
    static var previews: some View {
        ListPageView()
    }
}
