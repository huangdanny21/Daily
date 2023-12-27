//
//  TaskEditorView.swift
//  Daily
//
//  Created by Zhi Yong Huang on 12/27/23.
//

import SwiftUI

struct TaskEditorView: View {
    @State private var taskTitle = ""
    @State private var taskDescription = ""
    @State private var selectedCategory = "Work" // Initial category
    
    var body: some View {
        VStack {
            TextField("Task Title", text: $taskTitle)
                .padding()
            TextField("Task Description", text: $taskDescription)
                .padding()
            
            // Allow the user to select a category
            Picker("Category", selection: $selectedCategory) {
                Text("Work").tag("Work")
                Text("Personal").tag("Personal")
                // Add other categories/tags
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Button("Save Task") {
                // Save task with selected category
                let newTask = Task(id: UUID().uuidString, title: taskTitle, description: taskDescription, isRepeated: false, isDisabled: false, progress: 0)
                // Call your ViewModel method to save the task
            }
            .padding()
        }
    }
}


struct TaskEditorView_Previews: PreviewProvider {
    static var previews: some View {
        TaskEditorView()
    }
}
