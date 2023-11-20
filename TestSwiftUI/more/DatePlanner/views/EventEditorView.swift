//
//  EventEditorView.swift
//  TestSwiftUI
//
//  Created by PhamHai Dang on 20/11/2023.
//

import SwiftUI

struct EventEditorView: View {
    @State var event: Event
    var isNew = false
    let isEditting : Bool
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        List {
            if isNew {
                HStack {
                    Image(systemName: "newspaper")
                    Text("New Task")
                        .font(.title)
                        .fontWeight(.semibold)
                }.listRowSeparator(.hidden)
            }
            if isEditting {
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
            ForEach($event.tasks , id: \.self) {$task in
                TaskRow(task: $task)
            }
        }
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                if isNew {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct EventEditorView_Previews: PreviewProvider {
    static var previews: some View {
        EventEditorView(event: Event(), isNew: true, isEditting: true)
    }
}
