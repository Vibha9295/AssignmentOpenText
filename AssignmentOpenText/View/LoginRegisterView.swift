//
//  LoginRegisterView.swift
//  AssignmentOpenText
//
//  Created by Mac on 15/08/23.
//

import Foundation
import SwiftUI
struct LoginRegisterView: View {
    var body: some View {
        VStack {
            NavigationLink("Login", destination: LoginView())
                .padding()
            NavigationLink("Register", destination: RegisterView())
                .padding()
        }
        .navigationTitle("Authentication")
    }
}
struct RegisterView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Register") {
                authViewModel.register(username: username, password: password)
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
        .navigationTitle("Register")
    }
}

struct LoginView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onAppear {
                    // Load the username from Keychain when the view appears
                    if let storedUser = authViewModel.user {
                        username = storedUser.username
                    }
                }
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Login") {
                authViewModel.login(username: username, password: password)
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
        .navigationTitle("Login")
        .onDisappear {
            // Clear the password when navigating away from the view
            password = ""
        }
    }
}
