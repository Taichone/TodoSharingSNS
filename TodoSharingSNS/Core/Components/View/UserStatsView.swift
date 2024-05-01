//
//  UserStatsView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/05/01.
//

import SwiftUI

struct UserStatsView: View {
    let value: Int
    let title: String

    var body: some View {
        VStack {
            Text("\(self.value)")
                .font(.subheadline)
                .fontWeight(.semibold)

            Text(self.title)
                .font(.footnote)
        }
        .frame(width: 76)
    }
}

#Preview {
    UserStatsView(value: 810, title: "Followers")
}
