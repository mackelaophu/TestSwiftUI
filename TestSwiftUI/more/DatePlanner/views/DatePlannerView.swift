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
        List{
            ForEach(Period.allCases){period in
                Section(content: {
                    ForEach(eventData.events, id: \.self){event in
                        NavigationLink(destination: NoDataView(hidderBar: false), label: {
                            EventRow(event: event)
                        })
                    }
                },header: {
                    Text(period.name)
                })
            }
        }.navigationTitle("Date Planner")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem{
                    Button{
                        
                    }label: {
                        Image(systemName: "plus")
                    }
                }
            }

    }
}

struct DatePlannerView_preview : PreviewProvider {
    static var previews: some View {
        NavigationView{
            DatePlannerView(eventData: EventData())
        }
    }
}
