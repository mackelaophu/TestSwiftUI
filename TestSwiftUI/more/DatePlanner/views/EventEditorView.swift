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
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack {
            VStack {
                
                List {
                    if isNew {
                        HStack {
                            Image(systemName: "newspaper")
                            Text("New Task")
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                    }
                    DatePicker("test", selection: $event.date)
                        .labelsHidden()
                    ForEach($event.tasks , id: \.self) {$task in
                        TaskRow(task: $task)
                    }
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
}

struct EventEditorView_Previews: PreviewProvider {
    static var previews: some View {
        EventEditorView(event: Event(), isNew: true)
    }
}
