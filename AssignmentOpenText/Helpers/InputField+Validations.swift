//
//  InputField+Validations.swift
//  AssignmentOpenText
//
//  Created by Mac on 16/08/23.
//

import Foundation
import SwiftUI

struct InputField: View {
    
    // MARK: - Properties
    var title: String
    @Binding var text: String
    var isSecure = false
    var showError: Bool
    
    var body: some View {
        VStack {
            if showError {
                Text(title + " is required")
                    .font(.caption)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 20)
            }
            Group {
                if isSecure {
                    SecureField(title, text: $text)
                } else {
                    TextField(title, text: $text)
                }
            }
            .padding()
            .background(Color.white.opacity(0.5))
            .cornerRadius(10)
        }
        .padding(.vertical, 8)
    }
}
