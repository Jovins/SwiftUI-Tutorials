import SwiftUI

struct ScrollParallaxApp: View {
    var body: some View {
        NavigationStack {
            ScrollParallaxHome()
                .navigationTitle("Parallax Scroll")
        }
    }
}

#Preview {
    ScrollParallaxApp()
}
