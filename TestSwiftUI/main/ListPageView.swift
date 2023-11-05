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
        }
    }
    
    func getDestination(pageId: Navigationpage,groupID: NavigationGroup) ->some View {
        switch (groupID,pageId){
        case (.navigationApp,.story): return AnyView(NoDataView())
        case (.navigationApp,.datePlanner): return AnyView(DatePlannerView(eventData: EventData()))
        case (.presentingApp,.grids): return AnyView(NoDataView())
        case (.presentingApp,.editGrid): return AnyView(NoDataView())
        case (.presentingApp,.imageGallary): return AnyView(NoDataView())
        case (.presentingApp,.layoutView): return AnyView(NoDataView())
        default:
            return AnyView(NoDataView())
        }
    }
}

struct ListPageView_Previews: PreviewProvider {
    static var previews: some View {
        ListPageView()
    }
}
