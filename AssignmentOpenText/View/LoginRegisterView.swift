//
//  LoginRegisterView.swift
//  AssignmentOpenText
//
//  Created by Mac on 15/08/23.
//

import Foundation
import SwiftUI

struct LoginSignupView: View {
    
    // MARK: - Properties
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isLogin = true
    @State private var showError = false
    @EnvironmentObject var viewModel: LoginRegisterViewModel
    @State private var errorMessage = ""
    
    var body: some View {
        ZStack {
            Color.accentColor
            
            VStack {
                
                InputField(title: "Username", text: $username, showError: showError && !isUsernameValid()).onAppear {
                    // MARK: - Load the username from Keychain when the view appears
                    if isLogin {if let storedUser = viewModel.user {
                        username = storedUser.username
                    }
                    }
                }.padding(.horizontal)
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.bottom, 10)
                
                InputField(title: "Password", text: $password, isSecure: true, showError: showError && !isPasswordValid()).padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                
                if !isLogin {
                    InputField(title: "Confirm Password", text: $confirmPassword, isSecure: true, showError: showError && !isConfirmPasswordValid()).padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                }
                
                if showError && !isValidationSuccessful() {
                    Text("Please fill in all fields and ensure passwords match.")
                        .foregroundColor(.red)
                        .padding(.top, 10)
                }
                if showError {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding(.top, 10)
                }
                Button(action: {
                    showError = true
                    if isValidationSuccessful() {
                        if isLogin {
                            // MARK: - Handle login action
                            
                            if !viewModel.login(username: username, password: password) {
                                showError = true
                                errorMessage = "Invalid username or password"
                            }
                        } else {
                            // MARK: - Handle signup action
                            viewModel.register(username: username, password: password)
                        }
                    }
                }) {
                    Text(isLogin ? "Login" : "Sign Up")
                        .foregroundColor(.white)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(isValidationSuccessful() ? Color.blue : Color.gray)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                }
                
                Button(action: {
                    isLogin.toggle()
                    clearFields()
                }) {
                    Text(isLogin ? "Don't have an account? Sign Up" : "Already have an account? Log in")
                        .foregroundColor(.white)
                        .padding()
                }
            }.navigationTitle(isLogin ? "Login" : "Sign Up")
            
            
        }
        
    }
    
    // MARK: - Validation functions

    private func isUsernameValid() -> Bool {
        return !username.isEmpty
    }
    
    private func isPasswordValid() -> Bool {
        return !password.isEmpty
    }
    
    private func isConfirmPasswordValid() -> Bool {
        return !confirmPassword.isEmpty && confirmPassword == password
    }
    
    private func isValidationSuccessful() -> Bool {
        return isUsernameValid() && isPasswordValid() && (isLogin || isConfirmPasswordValid())
    }
    
    private func clearFields() {
        username = ""
        password = ""
        confirmPassword = ""
        showError = false
    }
}

