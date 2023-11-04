//
//  EventTask.swift
//  TestSwiftUI
//
//  Created by Hải Đăng on 04/11/2023.
//

import Foundation

struct EventTask: Identifiable, Hashable {
    var id = UUID()
    var text: String
    var isCompleted = false
    var isNew = false
}
