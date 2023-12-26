//
//  HomeCollectionView.swift
//  Daily
//
//  Created by Zhi Yong Huang on 12/25/23.
//

import SwiftUI

enum ListTypes {
    case daily
    case montly
    case yearly
    case completed
    case failed
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
