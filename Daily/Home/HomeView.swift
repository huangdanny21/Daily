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
    var body: some View {
        VStack {
            HomeSearchBarView()
            
            HomeCollectionView()
                .frame(height: 150)
            
            HomeTableView()
                .frame(minHeight: 150)
        }
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
        ScrollView(.vertical) {
            LazyHStack {
                ForEach(items, id: \.self) { item in
                    Text(item)
                        .padding()
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

