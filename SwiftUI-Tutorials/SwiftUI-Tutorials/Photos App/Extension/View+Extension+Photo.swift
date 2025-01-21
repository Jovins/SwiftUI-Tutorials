import SwiftUI

extension View {
    @ViewBuilder
    func didFrameChange(result: @escaping (CGRect, CGRect) -> ()) -> some View {
        self
            .overlay {
                GeometryReader {
                    let frame = $0.frame(in: .scrollView(axis: .vertical))
                    let bounds = $0.bounds(of: .scrollView(axis: .vertical)) ?? .zero
                    Color.clear
                        .preference(key: PhotoFrameKey.self, value: .init(frame: frame, bounds: bounds))
                        .onPreferenceChange(PhotoFrameKey.self) { value in
                            result(value.frame, value.bounds)
                        }
                }
            }
    }
}
