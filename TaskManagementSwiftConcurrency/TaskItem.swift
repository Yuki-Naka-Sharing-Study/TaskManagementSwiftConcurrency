//
//  TaskItem.swift
//  TaskManagementSwiftConcurrency
//
//  Created by 仲優樹 on 2025/06/28.
//

import Foundation

struct TaskItem: Identifiable {
    let id = UUID()
    let title: String
    var isCompleted: Bool = false
}
