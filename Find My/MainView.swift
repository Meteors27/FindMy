//
//  MainView.swift
//  Find My
//
//  Created by william on 2024/4/3.
//

import SwiftUI
import MapKit

struct MainView: View {
    var body: some View {
        TabView {
            PeopleView()
                .tabItem {
                    Image(systemName:"figure.2")
                    Text("People")
                }
            DevicesView()
                .tabItem {
                    Image(systemName:"macbook.and.iphone")
                    Text("Devices")
                }
            ItemsView()
                .tabItem {
                    Image(systemName:"circle.grid.2x2.fill")
                    Text("Items")
                }
            MeView()
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                    Text("Me")
                }
            

        }
    }
}

#Preview {
    MainView()
}
