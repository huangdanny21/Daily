//
//  RemindersViewModel.swift
//  Daily
//
//  Created by Zhi Yong Huang on 12/25/23.
//

import Foundation
import FirebaseFirestore
import Combine
import FirebaseAuth

class RemindersViewModel: ObservableObject {
    let db = Firestore.firestore()
    @Published var reminders: [String] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchReminders()
    }
    
    func fetchReminders() {
        if let userID = Auth.auth().currentUser?.uid {
            let remindersRef = db.collection("users").document(userID).collection("reminders")
            
            remindersRef.getDocuments { querySnapshot, error in
                if let error = error {
                    print("Error fetching reminders: \(error.localizedDescription)")
                } else if let documents = querySnapshot?.documents {
                    self.reminders = documents.compactMap { $0.data()["reminderText"] as? String }
                    print("Fetched \(self.reminders.count) reminders")
                }
            }
        } else {
            print("User not authenticated")
            // Handle the case when the user is not authenticated
        }
    }
    
    func addReminder(title: String, description: String) {
        guard !title.isEmpty else { return }
        let newReminder = "\(title): \(description)"
        
        if let user = Auth.auth().currentUser {
            saveReminderToFirestore(reminder: newReminder, userID: user.uid)
        } else {
            saveReminderLocally(reminder: newReminder)
        }
    }
    
    private func saveReminderToFirestore(reminder: String, userID: String) {
        let remindersRef = db.collection("users").document(userID).collection("reminders")
        
        remindersRef.addDocument(data: [
            "reminderText": reminder,
            "createdAt": Timestamp()
        ]) { error in
            if let error = error {
                print("Error adding reminder: \(error.localizedDescription)")
            } else {
                print("Reminder added to Firestore")
                self.fetchReminders()
            }
        }
    }
    
    private func saveReminderLocally(reminder: String) {
        reminders.append(reminder)
        objectWillChange.send()
    }
}
