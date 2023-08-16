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
        VStack {
            Text("Welcome, \(authViewModel.user?.username ?? "")!")
                .font(.title)
                .padding()
            Text("Authorized..  You are in!!")
                .font(.largeTitle)
            Button("Logout") {
                authViewModel.isLoggedIn = false
                //authViewModel.logout()
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            Button("Delete Account") {
                authViewModel.deleteAccount()
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .navigationTitle("Profile")
    }
}
