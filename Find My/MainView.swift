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
            Map()
                .tabItem {
                    Image(systemName:"figure.2")
                    Text("People")
                }
            Map()
                .tabItem {
                    Image(systemName:"macbook.and.iphone")
                    Text("Devices")
                }
            Map()
                .tabItem {
                    Image(systemName:"circle.grid.2x2.fill")
                    Text("Items")
                }
            Map()
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
