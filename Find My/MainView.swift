//
//  MainView.swift
//  Find My
//
//  Created by william on 2024/4/3.
//

import SwiftUI
import MapKit

struct MainView: View {
    @Environment(WindowSharedModel.self) private var windowSharedModel
    @Environment(SceneDelegate.self) private var sceneDelegate
    var body: some View {
        @Bindable var bindableObject = windowSharedModel
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
        .tabSheet(initialHeight: 110) {
            NavigationStack {
                ScrollView {
                    // show some sample mock devices
                    VStack(spacing: 15) {
                        if windowSharedModel.activeTab == .devices {
                            DeviceRowView("iphone", "William's iPhone 15 Pro", "This iPhone")
                            DeviceRowView("airpodspro", "William's AirPods Pro", "location 1")
                            DeviceRowView("applewatch", "William's Apple Watch", "location 2")
                            DeviceRowView("ipad", "William's iPad Pro", "location 3")
                        }
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                }
                .scrollIndicators(.hidden)
                .scrollContentBackground(.hidden )
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
            }
        }
        .onAppear {
            guard sceneDelegate.tabWindow == nil else {return}
            sceneDelegate.addTabBar(windowSharedModel)
        }
    }
    
    @ViewBuilder
    func DeviceRowView(_ image: String, _ title: String, _ subTitle: String, _ distance: String? = nil) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: image)
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
                    Text(title)
                        .bold()
                    Text(subTitle)
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            Text(distance ?? "0 km")
                    .font(.callout)
                    .foregroundStyle(.gray)
        }
    }
}

//#Preview {
//    MainView()
//}
