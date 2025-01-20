//
//  ExpandTabbarHome.swift
//  SwiftUI-Tutorials
//
//  Created by Jovins on 2025/1/16.
//

import SwiftUI

struct ExpandTabbarHome: View {
    
    @State var current = "Home"
    
    init(current: String = "Home") {
        self.current = current
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            TabView(selection: $current,
                    content:  {
                Text("Home")
                    .tag("Home")
                Text("Message")
                    .tag("Message")
                Text("Account")
                    .tag("Account")
            })
            HStack(spacing: .zero) {
                ExpandTabbar(title: "Home",
                             image: Image(systemName: "house"),
                             selected: $current)
                Spacer(minLength: 0)
                ExpandTabbar(title: "Message",
                             image: Image(systemName: "message"),
                             selected: $current)
                Spacer(minLength: 0)
                ExpandTabbar(title: "Account",
                             image: Image(systemName: "person"),
                             selected: $current)
            }
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background(Color.black.opacity(0.8))
            .clipShape(Capsule())
            .padding(.horizontal, 24)
        })
    }
}

#Preview {
    ExpandTabbarHome()
}
