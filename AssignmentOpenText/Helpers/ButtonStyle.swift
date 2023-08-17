//
//  ButtonStyle.swift
//  AssignmentOpenText
//
//  Created by Mac on 16/08/23.
//

import Foundation
import SwiftUI
struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.accentColor)
            .padding()
            .font(.title3)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.horizontal)

    }
}
