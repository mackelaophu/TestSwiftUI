//
//  EventEditorView.swift
//  TestSwiftUI
//
//  Created by PhamHai Dang on 20/11/2023.
//

import SwiftUI

struct EventEditor: View {
    @State var event: Event
    var isNew = false
    let isEditting : Bool
    @Environment(\.dismiss) private var dismiss
    @State private var eventCopy = Event()
    @EnvironmentObject var eventData : EventData
    var body: some View {
        EventDetail(event: $eventCopy, isEditting: isEditting)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                if isNew {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            ToolbarItem {
                Button {
                    if isNew {
                        eventData.events.append(eventCopy)
                        dismiss()
                    }
                } label: {
                    Text("Add")
                }
            }
        } .onAppear {
            eventCopy = event // Grab a copy in case we decide to make edits.
        }
    }
}

struct EventEditorView_Previews: PreviewProvider {
    static var previews: some View {
        EventEditor(event: Event.example, isNew: true, isEditting: true)
    }
}
