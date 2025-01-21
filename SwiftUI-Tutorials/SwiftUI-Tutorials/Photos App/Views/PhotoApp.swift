//
//  ContentView.swift
//  PhotosApp
//
//  Created by Jovins.Huang on 2024/7/16.
//

import SwiftUI

struct PhotoApp: View {
    
    var coordinator: PhotoCoordinator = .init()
    var body: some View {
        NavigationStack {
            PhotoHomeView()
                .environment(coordinator)
                .allowsHitTesting(coordinator.selectedItem == nil)
        }
        .overlay {
            Rectangle()
                .fill(.background)
                .ignoresSafeArea()
                .opacity(coordinator.animateView ? 1 - coordinator.dragProgress : 0)
        }
        .overlay {
            if coordinator.selectedItem != nil {
                PhotoDetailView()
                    .environment(coordinator)
                    .allowsHitTesting(coordinator.showDetailView)
            }
        }
        .overlayPreferenceValue(PhotoHeroKey.self, { value in
            if let selectedItem = coordinator.selectedItem,
               let sAnchor = value[selectedItem.id + "SOURCE"],
                let dAnchor = value[selectedItem.id + "DEST"] {
                PhotoHeroLayer(item: selectedItem,
                               sAnchor: sAnchor,
                               dAnchor: dAnchor)
                    .environment(coordinator)
                    
            }
        })
    }
}

#Preview {
    PhotoApp(coordinator: PhotoCoordinator())
}
