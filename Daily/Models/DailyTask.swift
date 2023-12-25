//
//  DailyTask.swift
//  Daily
//
//  Created by Zhi Yong Huang on 12/23/23.
//

import SwiftUI

enum RepeatType {
    case daily
    case weekly
    case monthly
}

struct DailyTask {
    let id: UUID
    var title: String
    var description: String
    var isRepeated: Bool
    var repeatType: RepeatType?
    var isDisabled: Bool
    var progress: Double
    var reward: Image?
}
