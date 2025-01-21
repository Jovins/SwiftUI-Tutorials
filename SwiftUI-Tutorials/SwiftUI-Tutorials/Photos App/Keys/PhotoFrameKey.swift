import SwiftUI

struct PhotoFrameKey: PreferenceKey {
    static var defaultValue: PhotoViewFrame = .init()
    static func reduce(value: inout PhotoViewFrame, nextValue: () -> PhotoViewFrame) {
        value = nextValue()
    }
}
