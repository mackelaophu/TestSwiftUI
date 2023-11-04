//
//  DatePlannerView.swift
//  TestSwiftUI
//
//  Created by Hải Đăng on 04/11/2023.
//

import SwiftUI

struct DatePlannerView : View {
    @ObservedObject var eventData: EventData
    @State private var isAddingNewEvent = false
    @State private var newEvent = Event()
    
    @State private var selection: Event?
    var body: some View {
        NavigationSplitView{
            List(selection: $selection){
                ForEach(Period.allCases){ period in
                    Section(content: {
                        ForEach(eventData.sortedEvents(period: period)) { $event in
                            EventRow(event: event)
                                .tag(event)
                                .swipeActions {
                                    Button(role: .destructive) {
                                        selection = nil
                                        eventData.delete(event)
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                        }
                    },header: {
                        Text(period.name).font(.callout)
                            .foregroundColor(.secondary)
                            .fontWeight(.bold)
                    }).disabled(eventData.sortedEvents(period: period).isEmpty)
                }
            }
        } detail: {
           
        }.toolbar{
            ToolbarItem{
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                }
            }
        }.navigationTitle("Date Planner")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct DatePlannerView_preview : PreviewProvider {
    static var previews: some View {
        DatePlannerView(eventData: EventData())
    }
}
