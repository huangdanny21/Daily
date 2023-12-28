//
//  HomeView.swift
//  Daily
//
//  Created by Zhi Yong Huang on 12/22/23.
//

import SwiftUI

enum HomeSections {
    case search
    case stats
    case list
}

struct HomeView: View {
    // MARK: Variables
    @State private var showNewReminder = false
    @ObservedObject var remindersViewModel: RemindersViewModel // Assuming you have a RemindersManager to manage reminders
    
    var body: some View {
        VStack {
            Spacer()
            HomeSearchBarView()
            Spacer()
            Text("All List")
                .font(.headline)
                .padding(.horizontal)
            HomeCollectionView()
                .frame(height: 150)
            Spacer()
            Text("Daily Task")
                .font(.headline)
                .padding(.horizontal)
            HomeTableView(remindersViewModel: remindersViewModel)
                .frame(minHeight: 150)
            Spacer()
            HStack {
                Button(action: {
                    // Action for the new button at bottom-left
                    // Add your functionality here
                    showNewReminder.toggle()
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .padding()
                }
                Spacer()
                NavigationLink(destination: ListDetailView()) {
                    Image(systemName: "list.bullet")
                        .font(.title)
                        .padding()
                }
            }
        }
        .sheet(isPresented: $showNewReminder, content: {
            NewReminderView(remindersViewModel: remindersViewModel)
        })
        .navigationBarTitle("Home")
        .padding()
        
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(remindersManager: RemindersManager())
//    }
//}



