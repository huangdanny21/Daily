//
//  HomeCollectionView.swift
//  Daily
//
//  Created by Zhi Yong Huang on 12/25/23.
//

import SwiftUI

enum ListTypes {
    case today
    case monthly
    case yearly
    case completed
    case failed
}

struct ListData {
    let type: ListTypes
    
    var description: String {
        switch type {
            case .today:
                return "Today"
            case .monthly:
                return "Monthly List"
            case .yearly:
                return "Yearly List"
            case .completed:
                return "Completed List"
            case .failed:
                return "Failed List"
        }
    }
}

struct HomeCollectionView: View {
    let data: [ListData] = [
        ListData(type: .today),
        ListData(type: .monthly),
        ListData(type: .yearly),
        ListData(type: .completed),
        ListData(type: .failed)
    ]
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(data, id: \.type) { listData in
                    CellView(listData: listData)
                        .frame(maxWidth: .infinity, maxHeight: 100)
                        .background(Color.gray)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationBarTitle("Collections")
    }
}

struct CellView: View {
    let listData: ListData
    
    var body: some View {
        VStack {
            Text(listData.description)
                .foregroundColor(.white)
                .font(.headline)
                .padding()
        }
    }
}
