//
//  EventEditorView.swift
//  TestSwiftUI
//
//  Created by PhamHai Dang on 20/11/2023.
//

import SwiftUI

struct EventEditor: View {
    @Binding var event: Event
    var isNew = false
    @State private var isEditting : Bool = false
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
                        } else {
                            if !isEditting {
                                withAnimation {
                                    event = eventCopy
                                    isEditting.toggle()
                                }
                            } else {
                                dismiss()
                            }
                        }
                    } label: {
                        Text( isNew ? "Add" : (isEditting ? "Done" : "Edit"))
                    }
                }
            } .onAppear {
                eventCopy = event
            }
    }
}

struct EventEditorView_Previews: PreviewProvider {
    static var previews: some View {
        EventEditor(event: .constant(Event.example), isNew: true)
    }
}
