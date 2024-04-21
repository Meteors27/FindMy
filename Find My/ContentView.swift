//
//  ContentView.swift
//  Find My
//
//  Created by william on 2024/4/3.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var isPresented: Bool = true
    var body: some View {
        // TODO: OnDismiss
        MainView(isPresented: !isPresented)
            .sheet(isPresented: $isPresented) {
                isPresented = false
            } content: {
                OnBoardingView(isPresented: $isPresented)
            }
    }
}

//#Preview {
//    ContentView()
//}

struct CustomTabBar: View {
    @Environment(WindowSharedModel.self) private var windowSharedModel
    var body: some View {
        VStack(spacing: 0) {
            Divider()
            
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Button(action: {
                       windowSharedModel.activeTab = tab
                    }, label: {
                        VStack {
                            Image(systemName: tab.rawValue)
                                .font(.title2)
                            Text(tab.title)
                                .font(.caption)
                        }
                        .foregroundColor(windowSharedModel.activeTab == tab ? .accentColor : .secondary)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .contentShape(.rect)
                    })
                }
            }
            .frame(height: 55)
        }
        .background(.regularMaterial)
    }
}
