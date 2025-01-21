import SwiftUI

struct PinterestApp: View {

    var body: some View {
        NavigationStack {
            PinterestHomeView()
                .toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    PinterestApp()
}
