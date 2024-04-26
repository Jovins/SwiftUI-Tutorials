import SwiftUI

struct ContentView: View {
    
    enum Tab {
        case feature
        case list
    }

    @State private var selection: Tab = .feature

    var body: some View {
        TabView(selection: $selection,
                content:  {
            CategoryHome()
                .tabItem {
                    Label("Feature", systemImage: "star")
                }
                .tag(Tab.feature)
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        })
    }
}
 
#Preview {
    ContentView()
        .environment(ModelData())
}
