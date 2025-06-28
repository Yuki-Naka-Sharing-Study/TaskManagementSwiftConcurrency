//
//  TaskManagerView.swift
//  TaskManagementSwiftConcurrency
//
//  Created by 仲優樹 on 2025/06/28.
//

import SwiftUI

struct TaskManagerView: View {
    @StateObject private var viewModel = TaskManagerViewModel()
    @State private var newTaskTitle: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("新しいタスク", text: $newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("追加") {
                        guard !newTaskTitle.isEmpty else { return }
                        viewModel.addTask(title: newTaskTitle)
                        newTaskTitle = ""
                    }
                }
                .padding()
                
                List {
                    ForEach(viewModel.tasks.indices, id: \.self) { index in
                        HStack {
                            Text(viewModel.tasks[index].title)
                            Spacer()
                            if viewModel.tasks[index].isCompleted {
                                Text("✅")
                            } else {
                                Button("完了") {
                                    viewModel.completeTask(at: index)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("タスク管理")
        }
    }
}

#Preview {
    TaskManagerView()
}
