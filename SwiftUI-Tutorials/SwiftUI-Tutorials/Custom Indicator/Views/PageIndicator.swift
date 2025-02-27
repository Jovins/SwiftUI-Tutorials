import SwiftUI

struct PageIndicator: View {
    
    var activeTintColor: Color = .primary
    var inActiveTintColor: Color = .primary.opacity(0.15)
    var opacityEffect: Bool = false
    var clipEdges: Bool = false

    var body: some View {
        GeometryReader {
            let width = $0.size.width
            if let scrollViewWidth = $0.bounds(of: .scrollView(axis: .horizontal))?.width,
               scrollViewWidth > 0 {
                let minX = $0.frame(in: .scrollView(axis: .horizontal)).minX
                let pages = Int(width / scrollViewWidth)
                // Progress
                let freeProgress = -minX / scrollViewWidth
                let clipProgress = min(max(freeProgress, 0.0), CGFloat(pages - 1))
                let progress = clipEdges ? clipProgress : freeProgress
                // Index
                let activeIndex = Int(progress)
                let nextIndex = Int(progress.rounded(.awayFromZero))
                let indicatorProgress = progress - CGFloat(activeIndex)
                // Indicator width's (Current & upcoming)
                let currentPageWidth = 18 - (indicatorProgress * 18)
                let nextPageWidth = indicatorProgress * 18
                
                HStack(spacing: 10) {
                    ForEach(0..<pages, id: \.self) { index in
                        Capsule()
                            .fill(.clear)
                            .frame(width: 8 + (activeIndex == index ? currentPageWidth : nextIndex == index ? nextPageWidth : 0),
                                   height: 8)
                            .overlay {
                                ZStack {
                                    Capsule()
                                        .fill(inActiveTintColor)
                                    Capsule()
                                        .fill(activeTintColor)
                                        .opacity(opacityEffect ? activeIndex == index ? 1 - indicatorProgress : nextIndex == index ? indicatorProgress : 0 : 1)
                                }
                            }
                    }
                }
                .frame(width: scrollViewWidth)
                .offset(x: -minX)
            }
        }
        .frame(height: 30)
    }
}
