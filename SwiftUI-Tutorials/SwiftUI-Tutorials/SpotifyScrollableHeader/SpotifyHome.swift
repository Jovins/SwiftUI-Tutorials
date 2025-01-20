//
//  SpotifyHome.swift
//  SwiftUI-Demos
//
//  Created by Jovins on 2025/1/15.
//

import SwiftUI

struct SpotifyHome: View {

    var safeArea: EdgeInsets
    var size: CGSize

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack  {
                ArkWork()
                
                GeometryReader { proxy in
                    let minY = proxy.frame(in: .named("SCROLL")).minY - safeArea.top
                    Button {
                        
                    } label: {
                        Text("SHUFFLE PLAY")
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 12)
                            .background {
                                Capsule()
                                    .fill(Color.green.gradient)
                            }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .offset(y: minY < 50 ? -(minY - 50) : 0)
                }
                .frame(height: 50)
                .padding(.top, -34)
                .zIndex(1.0)
                
                VStack {
                    Text("Popular")
                        .fontWeight(.heavy)
                    
                    AlbumView()
                }
                .padding(.top, 12)
                .zIndex(0)
            }
            .overlay(alignment: .top) {
                HeaderView()
            }
        }
        .coordinateSpace(name: "SCROLL")
    }

    @ViewBuilder
    private func ArkWork() -> some View {
        let height = size.height * 0.45
        
        GeometryReader { proxy in
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))

            Image("Dua")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: proxy.size.width, height: proxy.size.height + (minY > 0 ? minY : 0))
                .overlay {
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .fill(
                                .linearGradient(colors: [.black.opacity(0 - progress),
                                                         .black.opacity(0.1 - progress),
                                                         .black.opacity(0.3 - progress),
                                                         .black.opacity(0.5 - progress),
                                                         .black.opacity(0.7 - progress),
                                                         .black.opacity(0.9 - progress),
                                                         .black.opacity(1)],
                                                startPoint: .top,
                                                endPoint: .bottom))
                        VStack(spacing: 0) {
                            Text("Dua Lipa")
                                .font(.system(size: 42))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                            
                            Text("509,333 Monthly Listeners".uppercased())
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                                .padding(.top, 12)
                        }
                        .opacity(1 + (progress > 0 ? -progress : progress))
                        .padding(.bottom, 50)
                        .offset(y: minY < 0 ? minY : 0)
                    }
                }
                .clipped()
                .offset(y: -minY)
        }
        .frame(height: height + safeArea.top)
    }
    
    @ViewBuilder
    private func AlbumView() -> some View {
        VStack(spacing: 24) {
            ForEach(albums.indices, id: \.self) { index in
                HStack(spacing: 24) {
                    Text("\(index + 1)")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    VStack(alignment: .leading, spacing: 8) {
                        Text(albums[index].name)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Text("2,282")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: "ellipsis")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(16)
    }
    
    @ViewBuilder
    private func HeaderView() -> some View {
        GeometryReader { proxy in
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let height = size.height * 0.45
            let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))
            HStack(spacing: 16) {
                Button(action: {}, label: {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .foregroundColor(.white)
                })
                .padding(.leading, 4)

                Spacer(minLength: 0)

                Button(action: {}, label: {
                    Text("Follwing")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .border(.white, width: 1)
                })
                .opacity(1 + progress)

                Button(action: {}, label: {
                    Image(systemName: "ellipsis")
                        .font(.title3)
                        .foregroundColor(.white)
                })
            }
            .overlay {
                Text("Dua Lipa")
                    .fontWeight(.semibold)
                    .opacity(progress > 0 ? 0 : (-progress > 0.8 ? -progress : 0))
            }
            .padding(.top, safeArea.top +  8)
            .padding([.horizontal, .bottom], 16)
            .background(Color.black.opacity(-progress > 0.8 ? (-progress > 1 ? 1 : -progress) : 0))
            .offset(y: -minY)
        }
        .frame(height: 34)
    }
}

#Preview {
    ContentView()
}
