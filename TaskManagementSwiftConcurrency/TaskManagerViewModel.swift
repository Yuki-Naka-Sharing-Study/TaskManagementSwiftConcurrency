//
//  TaskManagerViewModel.swift
//  TaskManagementSwiftConcurrency
//
//  Created by 仲優樹 on 2025/06/28.
//

import Foundation

@MainActor
class TaskManagerViewModel: ObservableObject {
    @Published var tasks: [TaskItem] = []
    
    func addTask(title: String) {
        let newTask = TaskItem(title: title)
        tasks.append(newTask)
        log("追加: \(title)")
    }
    
    func completeTask(at index: Int) {
        guard tasks.indices.contains(index) else { return }
        tasks[index].isCompleted = true
        log("完了: \(tasks[index].title)")
    }
    
    // ✅ nonisolated：MainActor から分離して非同期処理からも自由に使える
    nonisolated func log(_ message: String) {
        let timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .short)
        print("[\(timestamp)] \(message)")
    }
}
