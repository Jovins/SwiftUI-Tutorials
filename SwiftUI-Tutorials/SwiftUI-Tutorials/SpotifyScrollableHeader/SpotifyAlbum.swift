//
//  SpotifyAlbum.swift
//  SwiftUI-Tutorials
//
//  Created by Jovins on 2025/1/16.
//

import Foundation

struct SpotifyAlbum: Identifiable {
    let id: String = UUID().uuidString
    let name: String
}

var albums: [SpotifyAlbum] = [SpotifyAlbum(name: "In Between"),
                              SpotifyAlbum(name: "More"),
                              SpotifyAlbum(name: "Big Jet Plane"),
                              SpotifyAlbum(name: "Empty Floor"),
                              SpotifyAlbum(name: "Black Hole Nights"),
                              SpotifyAlbum(name: "Rain on me"),
                              SpotifyAlbum(name: "Stuck with u"),
                              SpotifyAlbum(name: "7 rings"),
                              SpotifyAlbum(name: "Bang Bang"),
                              SpotifyAlbum(name: "Rain on me"),
                              SpotifyAlbum(name: "Stuck with u"),
                              SpotifyAlbum(name: "7 rings"),
                              SpotifyAlbum(name: "Bang Bang")]
