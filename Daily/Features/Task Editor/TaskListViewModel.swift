//
//  TaskListViewModel.swift
//  Daily
//
//  Created by Zhi Yong Huang on 12/27/23.
//

import Foundation
import FirebaseFirestore
import Combine

class TaskListViewModel: ObservableObject {
    let db = Firestore.firestore()
    @Published var tasks: [Task] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchTasks()
    }
    
    func fetchTasks() {
        // Fetch tasks from Firestore or your database
        // Example: Fetch tasks for the currently authenticated user
        
        // In this example, we assume a collection named "tasks" in Firestore
        let userID = "exampleUserID" // Replace with the actual userID
        
        let tasksRef = db.collection("users").document(userID).collection("tasks")
        
        tasksRef.addSnapshotListener { querySnapshot, error in
            if let error = error {
                print("Error fetching tasks: \(error.localizedDescription)")
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.tasks = documents.compactMap { document in
                guard
                    let title = document.data()["title"] as? String,
                    let description = document.data()["description"] as? String,
                    let isRepeated = document.data()["isRepeated"] as? Bool,
                    let isDisabled = document.data()["isDisabled"] as? Bool,
                    let progress = document.data()["progress"] as? Double
                else {
                    return Task(id: "", title: "", description: "", isRepeated: false, isDisabled: false, progress: 0)
                }
                let task = Task(id: UUID().uuidString, title: title, description: description, isRepeated: isRepeated, isDisabled: isDisabled, progress: progress)
                return task
            }
        }
    }
    
    func addTask(newTask: Task) {
        // Add a new task to Firestore or your database
        // Example: Adding a task to Firestore
        
        let userID = "exampleUserID" // Replace with the actual userID
        
        let tasksRef = db.collection("users").document(userID).collection("tasks")
        
        tasksRef.addDocument(data: newTask.toFirestoreData()) { error in
            if let error = error {
                print("Error adding task: \(error.localizedDescription)")
            } else {
                print("Task added to Firestore")
            }
        }
    }
    
    // Other methods for task manipulation, category filtering, etc.
}
