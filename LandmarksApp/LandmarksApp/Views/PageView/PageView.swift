import SwiftUI

struct PageView<Page: View>: View {
    
    var pages: [Page]
    @State private var currentPage: Int = 0

    var body: some View {
        ZStack(alignment: .bottomTrailing, content: {
            PageViewController(pages: pages, currentPage: $currentPage)
                .aspectRatio(3/2, contentMode: .fit)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
                .padding(.bottom, 8)
        })
    }
}

#Preview {
    PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
}
