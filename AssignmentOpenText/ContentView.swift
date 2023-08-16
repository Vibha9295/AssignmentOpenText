//
//  ContentView.swift
//  AssignmentOpenText
//
//  Created by Mac on 15/08/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @EnvironmentObject var viewModel: LoginRegisterViewModel
   
    var body: some View {
        NavigationView {

            if viewModel.isLoggedIn {
                ProfileView()
            }
            else {
                LoginSignupView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
