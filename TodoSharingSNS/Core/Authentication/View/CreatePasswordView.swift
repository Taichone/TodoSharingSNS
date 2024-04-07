//
//  CreatePasswordView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/04/07.
//

import SwiftUI

struct CreatePasswordView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel

    var body: some View {
        VStack(spacing: 12) {
            Text("Create a password")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)

            Text("Your password must be at least 6 characters in length")
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)

            SecureField("Password", text: self.$viewModel.password)
                .textInputAutocapitalization(.none)
                .modifier(TextFieldModifier())
                .padding(.top)

            NavigationLink {
                CompleteSignUpView()
                    .navigationBarBackButtonHidden()
            } label: {
                Text("Next")
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
    }
}

#Preview {
    CreatePasswordView()
}
