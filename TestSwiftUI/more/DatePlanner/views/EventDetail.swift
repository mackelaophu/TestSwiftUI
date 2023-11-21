//
//  EventDetail.swift
//  TestSwiftUI
//
//  Created by PhamHai Dang on 21/11/2023.
//

import SwiftUI

struct EventDetail: View {
    @Binding var event: Event
    let isEditting : Bool
    var body: some View {
        List {
            HStack {
                Image(systemName: event.symbol)
                    .foregroundColor(event.color)
                if !isEditting {
                    TextField("new", text: $event.title)
                } else {
                    Text(event.title)
                        .font(.title)
                        .fontWeight(.semibold)
                }
                
            }.listRowSeparator(.hidden)
            if !isEditting {
                DatePicker("", selection: $event.date)
                    .labelsHidden()
                    .listRowSeparator(.hidden)
            } else {
                HStack {
                    Text(event.date , style: .date)
                    Text(event.date, style : .time)
                }.listRowSeparator(.hidden)
            }
            Text("Tasks")
                .fontWeight(.bold)
            ForEach($event.tasks) {$task in
                TaskRow(task: $task, isEditing: !isEditting)
            } .onDelete(perform: { indexSet in
                event.tasks.remove(atOffsets: indexSet)
            })
        }
    }
}

struct EventDetail_Previews: PreviewProvider {
    static var previews: some View {
        EventDetail(event: .constant(Event.example), isEditting: true)
    }
}
