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
                    
                }
                .scrollIndicators(.hidden)
                .scrollContentBackground(.hidden )
                .toolbar(content: {
                    ToolbarItem(placement: .topBarLeading) {
                        Text(windowSharedModel.activeTab.title)
                            .font(.title3)
                            .bold()
                    }
                    if windowSharedModel.activeTab == .devices {
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
}

#Preview {
    MainView()
}
