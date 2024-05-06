//
//  CreateUsernameView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/04/07.
//
import SwiftUI

struct CreateUsernameView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel

    var body: some View {
        VStack(spacing: 12) {
            Text("Create username")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)

            Text("Pick a username for your new account. You can always change it later")
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)

            TextField("Username", text: self.$viewModel.username)
                .textInputAutocapitalization(.none)
                .modifier(TextFieldModifier())

            NavigationLink {
                CreatePasswordView()
                    .navigationBarBackButtonHidden()
            } label: {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width:360, height: 44)
                    .background(Color.mint)
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
    CreateUsernameView()
}
