//
//  HomeTableView.swift
//  Daily
//
//  Created by Zhi Yong Huang on 12/25/23.
//

import SwiftUI

struct HomeTableView: View {
    @ObservedObject var remindersViewModel: RemindersViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                List(remindersViewModel.reminders, id: \.self) { reminder in
                    VStack(alignment: .leading) {
                        Text(reminder)
                            .font(.headline)
                        // You can add additional Text or views here to display more information about the reminder
                    }
                    .padding(.vertical, 8)
                }
                .navigationBarTitle("Reminders")
            }
            .onAppear {
                // Fetch reminders from Firestore or local storage when the view appears
                remindersViewModel.fetchReminders()
                
                // Setup a publisher to monitor changes in the reminders array
                remindersViewModel.$reminders
                    .sink { _ in
                        // Do something when the reminders array changes
                    }
                    .store(in: &remindersViewModel.cancellables)
            }
        }
    }
}



