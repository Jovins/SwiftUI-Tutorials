//
//  ExpandTabbar.swift
//  SwiftUI-Tutorials
//
//  Created by Jovins on 2025/1/16.
//

import SwiftUI

@available(iOS 15.0, *)
struct ExpandTabbar: View {

    var title: String
    var image: Image
    @Binding var selected: String

    var body: some View {
        Button {
            withAnimation(.spring()) {
                selected = title
            }
        } label: {
            HStack(spacing: 8) {
                image
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
                if selected == title {
                    Text(title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(Color.white.opacity(selected == title ? 0.1 : 0))
        .clipShape(Capsule())
    }
}
