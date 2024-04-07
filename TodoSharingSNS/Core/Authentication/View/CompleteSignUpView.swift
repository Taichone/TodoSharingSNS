//
//  CompleteSignUpView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/04/07.
//

import SwiftUI

struct CompleteSignUpView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel

    var body: some View {
        VStack(spacing: 12) {
            Spacer()

            Text("Welcome to iMana, \(self.viewModel.username)")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
                .multilineTextAlignment(.center)

            Text("Click below to complete registration and start using iMana")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)

            Button {
                Task { try await self.viewModel.createUser() }
            } label: {
                Text("Complete sign up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width:360, height: 44)
                    .background(Color(.systemBlue))
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
            }
            .padding(.vertical)

            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        self.dismiss()
                    }
            }
        }
    }}

#Preview {
    CompleteSignUpView()
}
