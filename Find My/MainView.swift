//
//  MainView.swift
//  Find My
//
//  Created by william on 2024/4/3.
//

import SwiftUI
import MapKit

struct MainView: View {
    let isPresented: Bool
    @Environment(WindowSharedModel.self) private var windowSharedModel
    @Environment(SceneDelegate.self) private var sceneDelegate
    @State var deviceDetailPresented: Bool = false
    @State private var settingsDetent = PresentationDetent.medium
    @State private var isBoardingPresented = true
    var body: some View {
        @Bindable var bindableObject = windowSharedModel
        if isPresented {
            TabView(selection: $bindableObject.activeTab) {
                PeopleView()
                    .tabItem {
                        Image(systemName:"figure.2")
                        Text("People")
                    }
                    .tag(Tab.people)
                    .hideNativeTabBar()
                DevicesView()
                    .tabItem {
                        Image(systemName:"macbook.and.iphone")
                        Text("Devices")
                    }
                    .tag(Tab.devices)
                    .hideNativeTabBar()
                ItemsView()
                    .tabItem {
                        Image(systemName:"circle.grid.2x2.fill")
                        Text("Items")
                    }
                    .tag(Tab.items)
                    .hideNativeTabBar()
                MeView()
                    .tabItem {
                        Image(systemName: "person.crop.circle.fill")
                        Text("Me")
                    }
                    .tag(Tab.me)
                    .hideNativeTabBar()
            }
            .tabSheet(initialHeight: 110, settingsDetent: $settingsDetent) {
                NavigationStack {
                    ScrollView {
                        // show some sample mock devices
                        VStack(spacing: 15) {
                            if windowSharedModel.activeTab == .devices {
                                DeviceRowView(device: .iphone)
                                DeviceRowView(device: .airpodspro)
                                DeviceRowView(device: .applewatch)
                                DeviceRowView(device: .ipad)
                            }
                        }
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                    }
                    .scrollIndicators(.hidden)
                    .scrollContentBackground(.hidden)
                    .toolbar(content: {
                        ToolbarItem(placement: .topBarLeading) {
                            Text(windowSharedModel.activeTab.title)
                                .font(.title3)
                                .bold()
                        }
                        if [.devices, .people, .items].contains(windowSharedModel.activeTab) {
                            ToolbarItem(placement: .topBarTrailing) {
                                Button(action: {
                                }, label: {
                                    Image(systemName: "plus")
                                })
                            }
                        }
                    })
                    .sheet(isPresented: $deviceDetailPresented, content: {
                        VStack(spacing: 0) {
                            DeviceDetailView(isShow: $deviceDetailPresented)
                        }
                            .presentationDetents([.height(110), .medium, .fraction(0.99)], selection: $settingsDetent)
                            .presentationCornerRadius(15)
                            .presentationBackgroundInteraction(.enabled(upThrough: .medium))
                            .presentationBackground(.clear)
                            .background(.regularMaterial)
                            .interactiveDismissDisabled()
                    })

                }
            }
            .onAppear {
                guard sceneDelegate.tabWindow == nil else {return}
                sceneDelegate.addTabBar(windowSharedModel)
            }
            .onChange(of: deviceDetailPresented) {
                if !deviceDetailPresented {
                    sceneDelegate.showTabBar()
                    windowSharedModel.activeDevice = nil
                }
            }
    //        .onChange(of: windowSharedModel.activeDevice) {
    //            deviceDetailPresented = true
    //        }
            
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    func DeviceRowView(device: Device, distance: String? = nil) -> some View {
        Button {
            sceneDelegate.removeTabBar()
            windowSharedModel.activeDevice = device
            deviceDetailPresented = true
            print("Current active device is \(windowSharedModel.activeDevice?.name ?? "nil")")
        } label: {
            HStack(alignment: .top, spacing: 12) {
                Image(systemName: device.systemName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .padding(8)
                    .background(.background)
                    .clipShape(Circle())
                    .padding(2)
                    .background(.ultraThinMaterial)
                    .clipShape(Circle())
                    // TODO: add a gray ring
                    VStack(alignment: .leading, spacing: 4) {
                        Text(device.name)
                            .bold()
                        Text(device.description)
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                Text(distance ?? "0 km")
                        .font(.callout)
                        .foregroundStyle(.gray)
            }
            .foregroundStyle(.foreground)
        }
    }
}

//#Preview {
//    MainView()
//}
