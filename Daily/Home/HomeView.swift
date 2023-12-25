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
    @State private var showNewReminder = false
    
    var body: some View {
        VStack {
            Spacer()
            HomeSearchBarView()
            Spacer()
            HomeCollectionView()
                .frame(height: 150)
            Spacer()
            HomeTableView()
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
            NewReminderView()
        })
        .padding()
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct HomeSearchBarView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            TextField("Search", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
    }
}

struct HomeCollectionView: View {
    let items = (1...10).map { "Item \($0)" } // Replace with your data model
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.flexible(), spacing: 10),
                GridItem(.flexible(), spacing: 10)
            ], spacing: 10) {
                ForEach(items, id: \.self) { item in
                    Text(item)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}


struct HomeTableView: View {
    let data = (1...10).map { "Row \($0)" } // Replace with your data model
    
    var body: some View {
        List(data, id: \.self) { row in
            Text(row)
        }
    }
}

