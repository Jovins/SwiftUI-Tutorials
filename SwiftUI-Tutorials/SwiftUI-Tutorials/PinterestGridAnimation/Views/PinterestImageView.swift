import SwiftUI

struct PinterestImageView: View {
    var item: PinterestItem
    var body: some View {
        GeometryReader {
            let size = $0.size
            if let image = item.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .clipped()
            }
        }
    }
}
