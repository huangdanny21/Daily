//
//  DailyTask.swift
//  Daily
//
//  Created by Zhi Yong Huang on 12/23/23.
//

import SwiftUI
import FirebaseFirestore

enum RepeatType: String {
    case daily
    case weekly
    case monthly
}

struct Task {
    let id: String
    var title: String
    var description: String
    var isRepeated: Bool
    var repeatType: RepeatType? = .daily
    var isDisabled: Bool
    var progress: Double
    //var reward: Image?
    
    func toFirestoreData() -> [String: Any] {
        var data: [String: Any] = [
            "title": title,
            "description": description,
            "isRepeated": isRepeated,
            "isDisabled": isDisabled,
            "progress": progress
            // Add other properties as needed
        ]
        
        if let repeatType = repeatType {
            data["repeatType"] = repeatType
        }
        
        // Handle the reward property separately (convert Image to Data or URL if needed)
        // data["reward"] = ...
        
        return data
    }
}
