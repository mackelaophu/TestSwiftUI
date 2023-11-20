//
//  TaskRow.swift
//  TestSwiftUI
//
//  Created by PhamHai Dang on 20/11/2023.
//

import SwiftUI

struct TaskRow: View {
    @Binding var task: EventTask
    var body: some View {
        HStack {
            Button {
                task.isCompleted.toggle()
            } label: {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
            }
            .buttonStyle(.plain)
            Text(task.text)
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: .constant(EventTask(text: "test")))
    }
}
