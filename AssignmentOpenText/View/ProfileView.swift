//
//  ProfileView.swift
//  AssignmentOpenText
//
//  Created by Mac on 15/08/23.
//

import Foundation
import SwiftUI


struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            Color.accentColor
            VStack {
                
                Text("Welcome, \(authViewModel.user?.username ?? "")!")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                Text("Authorized..  You are in!!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                
                Button("Logout") {
                    authViewModel.isLoggedIn = false
                    if KeychainServicesHelper.deleteUser(username: authViewModel.user?.username ?? ""){
                        authViewModel.isLoggedIn = false
                    }
                }
                
                .foregroundColor(.accentColor)
                .padding()
                .font(.title3)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal)
                
                Button("Delete Account") {
                    authViewModel.deleteAccount()
                }
                .foregroundColor(.accentColor)
                .padding()
                .font(.title3)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal)
            }}.navigationTitle("Profile")
    }
}
