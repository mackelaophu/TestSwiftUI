//
//  DatePlannerView.swift
//  TestSwiftUI
//
//  Created by Hải Đăng on 04/11/2023.
//

import SwiftUI

struct DatePlannerView : View {
    @EnvironmentObject var eventData: EventData
    @State private var isAddingNewEvent = false
    @State private var newEvent = Event()
    
    @State private var selection: Event?
    var body: some View {
        List{
            ForEach(Period.allCases){period in
                Section(content: {
                    ForEach(eventData.sortedEvents(period: period)){$event in
                        NavigationLink{
                            EventEditor(event: event, isEditting : true)
                        } label:{
                            EventRow(event: event)
                        }
                    }
                },header: {
                    Text(period.name)
                })
            }
        }.navigationTitle("Date Planner")
            .toolbar{
                ToolbarItem{
                    Button{
                        isAddingNewEvent = true
                        newEvent = Event()
                    }label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddingNewEvent, content: {
                NavigationView{
                    EventEditor(event: newEvent, isNew: true, isEditting : false)
                }
            })
        
    }
}

struct DatePlannerView_preview : PreviewProvider {
    static var previews: some View {
        NavigationView{
            DatePlannerView().environmentObject(EventData())
        }
    }
}
