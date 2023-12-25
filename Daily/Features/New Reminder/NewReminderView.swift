//
//  NewReminderView.swift
//  Daily
//
//  Created by Zhi Yong Huang on 12/22/23.
//

import SwiftUI

struct NewReminderView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var remindersManager: RemindersManager
    
    @State private var isAddButtonEnabled = false
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                VStack(alignment: .center) {
                    // Existing UI components
                    
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
                    
                    Button("Add") {
                        addNewReminder()
                        presentationMode.wrappedValue.dismiss()
                    }
                    .padding()
                    .disabled(!isAddButtonEnabled)
                }
                .padding(.horizontal)
            }
            .navigationBarTitle("New Reminder")
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
    private func updateAddButtonState() {
        // Enable Add button if the title field is not empty
        isAddButtonEnabled = !title.isEmpty
    }
    
    private func addNewReminder() {
        guard !title.isEmpty else { return }
        let newReminder = "\(title): \(description)"
        remindersManager.addReminder(newReminder)
    }
}
