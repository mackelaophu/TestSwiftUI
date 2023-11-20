//
//  TaskRow.swift
//  TestSwiftUI
//
//  Created by PhamHai Dang on 20/11/2023.
//

import SwiftUI

struct TaskRow: View {
    @Binding var task: EventTask
    var isEditing = false
    
    @FocusState private var isFocused: Bool
    var body: some View {
        HStack {
            Button {
                task.isCompleted.toggle()
            } label: {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
            }
            .buttonStyle(.plain)
            if isEditing || task.isNew {
                TextField("Task description", text: $task.text)
                    .focused($isFocused)
                    .onChange(of: isFocused) { newValue in
                        if newValue == false {
                            task.isNew = false
                        }
                    }
            } else {
                Text(task.text)
            }
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: .constant(EventTask(text: "test")), isEditing: true)
    }
}
