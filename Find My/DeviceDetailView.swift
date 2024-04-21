//
//  DeviceDetailView.swift
//  Find My
//
//  Created by william on 2024/4/3.
//

import SwiftUI

struct DeviceDetailView: View {
    @Environment(WindowSharedModel.self) private var windowSharedModel
    @Environment(SceneDelegate.self) private var sceneDelegate
    @Binding var isShow: Bool
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                DeviceHeadline(device: windowSharedModel.activeDevice, lastSeen: "1 minute ago", battery: "battery.100percent", isShow: $isShow)
                HStack {
                    DeviceDetailButton(title: "Play Sound", iconName: "play.fill", color: .purple) {
                        Text("Off")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                        .padding(.trailing, 5)
                    
                    DeviceDetailButton(title: "Find", iconName: "arrow.up", color: .green, action: {
                        sceneDelegate.showNearbyWindow()
                    }) {
                        Text("Nearby")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                        .padding(.leading, 5)

                }
                DeviceDetailButton(title: "Mark as Lost", iconName: "bell.fill", color: .red) {
                    Text("Off")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                Spacer()
            }
            .padding(.top, -15)
            .padding(.horizontal, 15)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text(windowSharedModel.activeDevice.name)
                        .font(.title3)
                        .bold()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isShow = false
                        sceneDelegate.showTabBar()
                    }, label: {
                        Circle()
                            .fill(Color(.secondarySystemFill))
                            .frame(width: 30, height: 30)
                            .overlay(
                                Image(systemName: "xmark")
                                    .font(.system(size: 12, weight: .bold, design: .rounded))
                                    .foregroundColor(.secondary)
                            )
                    })
                }
            }
        }
    }
}

struct DeviceHeadline: View {
    var device: Device
    var lastSeen: String
    var battery: String
    @Binding var isShow: Bool
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 0) {
                Text(device.description)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                HStack {
                    Text(lastSeen)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Image(systemName: battery)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            Spacer()
            
        }
    }
}

struct DeviceDetailButton<Content: View>: View {
    let title: String
    let iconName: String
    let color: Color
    let action: (() -> Void)
    @ViewBuilder let content: () -> Content
    
    init(title: String, iconName: String, color: Color, action: @escaping () -> Void = {}, @ViewBuilder content: @escaping () -> Content) {
            self.title = title
            self.iconName = iconName
            self.color = color
            self.action = action
            self.content = content
        }
    
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            VStack(alignment: .leading) {
                Image(systemName: iconName)
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                    .frame(width: 15, height: 15)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(color)
                    .clipShape(Circle())
                    .padding(.bottom, 10)
                Text(title)
                    .font(.subheadline)
                    .bold()
                content()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.foreground)
            .background(.background)
            .backgroundStyle(.regularMaterial)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.08), radius: 5)
        })
//        .padding(.horizontal, 5)
        .padding(.vertical, 5)
    }
}

//#Preview {
//    DeviceDetailView()
//}
