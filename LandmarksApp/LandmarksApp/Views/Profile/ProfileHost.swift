import SwiftUI

struct ProfileHost: View {
    
    @Environment(ModelData.self) var modelData
    @Environment(\.editMode) var editMode
    @State private var draftProfile = Profile.default

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive {
                ProfileDetail(profile: modelData.profile)
            } else {
                EditProfileView(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

#Preview {
    ProfileHost()
        .environment(ModelData())

}
