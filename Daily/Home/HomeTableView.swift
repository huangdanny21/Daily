//
//  HomeTableView.swift
//  Daily
//
//  Created by Zhi Yong Huang on 12/25/23.
//

import SwiftUI

struct HomeTableView: View {
    @ObservedObject var remindersManager: RemindersManager // Assuming you have a RemindersManager to manage reminders
    
    var body: some View {
        NavigationView {
            VStack {
                List(remindersManager.reminders, id: \.self) { reminder in
                    VStack(alignment: .leading) {
                        Text(reminder)
                            .font(.headline)
                        // You can add additional Text or views here to display more information about the reminder
                    }
                    .padding(.vertical, 8)
                }
                .navigationBarTitle("Reminders")
            }
        }
    }
}

