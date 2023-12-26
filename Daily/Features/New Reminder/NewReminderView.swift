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
                VStack(alignment: .center, spacing: 20) {
                    Image(systemName: "square.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray)
                        .padding()
                    
                    TextField("Title", text: $title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .onChange(of: title) { newValue in
                            updateAddButtonState()
                        }
                    
                    TextEditor(text: $description)
                        .frame(height: 100)
                        .padding()
                        .onChange(of: description) { newValue in
                            updateAddButtonState()
                        }
                }
                .padding()
                
                Spacer()
            }
            .navigationBarTitle("New Reminder")
            .navigationBarItems(
                leading: Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Add") {
                    addNewReminder()
                    presentationMode.wrappedValue.dismiss()
                }.disabled(!isAddButtonEnabled)
            )
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
