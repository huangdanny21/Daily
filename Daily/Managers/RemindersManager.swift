//
//  RemindersManager.swift
//  Daily
//
//  Created by Zhi Yong Huang on 12/25/23.
//

import SwiftUI
import Combine

class RemindersManager: ObservableObject {
    @Published var reminders: [String] = []
    
    func addReminder(_ reminder: String) {
        reminders.append(reminder)
    }
}
