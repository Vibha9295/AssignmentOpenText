//
//  AuthViewModel.swift
//  AssignmentOpenText
//
//  Created by Mac on 15/08/23.
//

import Foundation
import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var user: UserModel?
    
    init() {
        checkAuthentication()
    }
    
    private func checkAuthentication() {
        if let storedUser = KeychainServicesHelper.loadUserData() {
            user = storedUser
            isLoggedIn = true
        }
    }
    
    func register(username: String, password: String) {
        let newUser = UserModel(username: username, password: password)
        KeychainServicesHelper.saveUserData(user: newUser)
        user = newUser
        isLoggedIn = true
    }
    
    func login(username: String, password: String) {
        guard let storedUser = user else {
            return
        }
        
        if storedUser.username == username && storedUser.password == password {
            isLoggedIn = true
        }
    }
    
    
    func logout() {
        KeychainServicesHelper.deleteUserData()
        user = nil
        isLoggedIn = false
    }
    
    func deleteAccount() {
        KeychainServicesHelper.deleteUserData()
        user = nil
        isLoggedIn = false
    }
}
