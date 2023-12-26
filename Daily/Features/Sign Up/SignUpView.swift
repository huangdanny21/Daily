//
//  SignUpView.swift
//  Daily
//
//  Created by Zhi Yong Huang on 12/25/23.
//

import SwiftUI
import FirebaseAuth

struct SignupView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Sign Up") {
                signUp()
            }
            .padding()
        }
        .navigationBarTitle("Sign Up")
    }
    
    private func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                // Handle signup error
                print("Sign up failed: \(error.localizedDescription)")
            } else {
                // User signed up successfully
                print("User signed up")
                // Navigate to the next screen or perform necessary actions
            }
        }
    }
}
