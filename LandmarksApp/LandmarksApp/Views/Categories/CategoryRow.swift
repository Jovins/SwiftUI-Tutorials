import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]

    var body: some View {
        VStack(alignment: .leading, content: {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 16)
                .padding(.top, 4)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0, content: {
                    ForEach(items) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                })
            }
            .frame(height: 186)
        })
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    return CategoryRow(categoryName: landmarks[0].category.rawValue, items: Array(landmarks.prefix(5)))
}
