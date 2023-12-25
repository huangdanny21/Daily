//
//  NewReminderView.swift
//  Daily
//
//  Created by Zhi Yong Huang on 12/22/23.
//

import SwiftUI

struct NewReminderView: View {
    @Environment(\.presentationMode) var presentationMode

    @State private var isAddButtonEnabled = false
    @State private var title = ""
    @State private var description = ""

    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                VStack(alignment: .center) {
                    Image(systemName: "photo") // Placeholder image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .padding()
                        .foregroundColor(.gray)
                        .border(Color.gray, width: 1)

                    TextField("Title", text: $title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                        .onChange(of: title) { newValue in
                            updateAddButtonState()
                        }

                    TextEditor(text: $description)
                        .frame(height: 100)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.green, lineWidth: 1)
                        )
                        .onChange(of: description) { newValue in
                            updateAddButtonState()
                        }
                }

                Spacer()

                HStack {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .padding()

                    Spacer()

                }
                .padding(.horizontal)
            }
            .navigationBarTitle("New Reminder")
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Add") {
                // Perform action when Add button is tapped
            }.disabled(!isAddButtonEnabled))
        }
    }

    // MARK: - Private
    
    private func updateAddButtonState() {
        // Enable Add button if the title field is not empty
        isAddButtonEnabled = !title.isEmpty
    }
}
