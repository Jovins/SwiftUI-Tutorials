//
//  ContentView.swift
//  SwiftUI-Tutorials
//
//  Created by Jovins on 2025/1/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader {
            let safeArea = $0.safeAreaInsets
            let size  = $0.size
            SpotifyHome(safeArea: safeArea, size: size)
                .ignoresSafeArea(.container, edges: .top)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
