import SwiftUI

struct CategoryItem: View {
    
    var landmark: Landmark

    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 154, height: 154)
                .clipShape(RoundedRectangle(cornerRadius: 4))
            Text(landmark.name)
                .foregroundStyle(.primary)
                .font(.callout)
        }
        .padding(.leading, 16)
    }
}

#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}
