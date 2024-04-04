//
//  ContentView.swift
//  Find My
//
//  Created by william on 2024/4/3.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var isSheetPresented = true
    var body: some View {
        MainView()
            .sheet(isPresented: $isSheetPresented) {
                OnBoardingView(isPresented: $isSheetPresented)
            }
    }
}

#Preview {
    ContentView()
}
