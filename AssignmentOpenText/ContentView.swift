//
//  ContentView.swift
//  AssignmentOpenText
//
//  Created by Mac on 15/08/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            if authViewModel.isLoggedIn {
                ProfileView()
            } else {
                LoginRegisterView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
