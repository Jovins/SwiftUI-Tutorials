import SwiftUI

struct PinterestHomeView: View {
    
    private var coordinator = PinterestCoordinator.init()
    @State private var items: [PinterestItem] = pinterestItems
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading, spacing: 12) {
                Text("Hello Pinterest")
                    .font(.largeTitle.bold())
                    .padding(.top, 12)
                LazyVGrid(columns: Array(repeating: GridItem(spacing: 8), count: 2), spacing: 8) {
                    ForEach(items) { item in
                        PostCardView(item)
                    }
                }
            }
            .padding(8)
            .background(ScrollViewExtractor {
                coordinator.scrollview = $0
            })
        }
        .opacity(coordinator.hideRootView ? 0 : 1)
        .scrollDisabled(coordinator.hideRootView)
        .allowsHitTesting(!coordinator.hideRootView)
        .overlay {
            Detail()
                .environment(coordinator)
                .allowsHitTesting(coordinator.hideLayer)
        }
    }
    
    @ViewBuilder
    func PostCardView(_ item: PinterestItem) -> some View {
        GeometryReader {
            let frame = $0.frame(in: .global)
            PinterestImageView(item: item)
                .clipShape(.rect(cornerRadius: 12))
                .contentShape(.rect(cornerRadius: 12))
                .onTapGesture {
                    coordinator.toggleView(show: true, frame: frame, item: item)
                }
        }
        .frame(height: 220)
    }
}
