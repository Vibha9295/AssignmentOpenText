import SwiftUI

struct ProfileView: View {
    
    // MARK: - Properties
    @EnvironmentObject var viewModel: LoginRegisterViewModel
    
    var body: some View {
        ZStack {
            Color.accentColor
            VStack {
                // MARK: - Welcome Messages
                Text("Welcome, \(viewModel.user?.username ?? "")!")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                
                Text("Authorized.. You are in!!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                
                // MARK: - Logout Button
                Button("Logout") {
                    viewModel.isLoggedIn = false
                    if KeychainServicesHelper.deleteUser(username: viewModel.user?.username ?? "") {
                        viewModel.isLoggedIn = false
                    }
                }.modifier(ButtonStyle())
                
                
                // MARK: - Delete Account button
                Button("Delete Account") {
                    viewModel.deleteAccount()
                    
                }.modifier(ButtonStyle())
            }
        }
        .navigationTitle("Profile")
    }
}
