//
//  RootView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/03/24.
//

import SwiftUI

struct RootView: View {
    @ObservedObject var viewModel: RootViewModel
    
    var body: some View {
        if self.viewModel.isAuthenticated {
            HomeView(viewModel: self.viewModel)
        } else {
            SignInView(viewModel: self.viewModel)
        }
    }
}

#Preview {
    RootView(viewModel: RootViewModel())
}
