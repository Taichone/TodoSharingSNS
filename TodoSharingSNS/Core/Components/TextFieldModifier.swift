//
//  TextFieldModifier.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/04/06.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
            .padding(.horizontal, 24)
    }
}
