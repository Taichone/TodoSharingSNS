//
//  AddEmailView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/04/06.
//

import SwiftUI

struct AddEmailView: View {
    @State private var email = ""
    @Environment(\.dismiss) var dismiss // NavigationLink があればいらないが、練習のため
    @EnvironmentObject var viewModel: RegistrationViewModel

    var body: some View {
        VStack(spacing: 12) {
            Text("Add your email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)

            Text("You'll use this email to sign in to your account")
                .font(.footnote)
                .foregroundStyle(.gray)
                .padding(.horizontal, 24)

            TextField("Email", text: self.$viewModel.email)
                .textInputAutocapitalization(.none)
                .modifier(TextFieldModifier())

            NavigationLink {
                // TODO: - CreateUsernameView()
                Text("Create Username")
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
    AddEmailView()
        .environmentObject(RegistrationViewModel())
}
