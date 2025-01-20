//
//  ParallaxScrollViewHome.swift
//  SwiftUI-Tutorials
//
//  Created by Jovins on 2025/1/16.
//

import SwiftUI

struct ParallaxScrollViewHome: View {
    let imageNames = [
        "building 1", "building 2", "building 3",
        "building 4", "building 5", "building 6",
        "building 7", "building 8", "building 9",
        "building 10","building 11","building 12"
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                ForEach(imageNames, id: \.self) { name in
                    VStack {
                        ZStack {
                            Image(name)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .scrollTransition(axis: .horizontal) { content, phase in
                                    content.offset(x: phase.isIdentity ? 0 : phase.value * -200)
                                }
                        }
                        .containerRelativeFrame(.horizontal)
                        .clipShape(RoundedRectangle(cornerRadius: 32))
                        .shadow(color: .black.opacity(0.2), radius: 8, x: 4, y: 8)
                        .scrollTransition(axis: .horizontal) { content, phase in
                            content.scaleEffect(phase.isIdentity ? 1 : 0.95)
                        }
                        
                        Text(name)
                            .scrollTransition(axis: .horizontal) { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1 : 0)
                                    .offset(x: phase.value * 100)
                            }
                    }
                }
            }
        }
        .contentMargins(32)
        .scrollTargetBehavior(.paging)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ParallaxScrollViewHome()
}
