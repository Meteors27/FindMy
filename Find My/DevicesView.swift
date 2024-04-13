//
//  DevicesView.swift
//  Find My
//
//  Created by william on 2024/4/5.
//

import SwiftUI
import MapKit

struct DevicesView: View {
    var body: some View {
        ZStack {
            Map()
            ButtonsView()
                .padding()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .topTrailing)
        }
    }
}

struct ButtonsView: View {
    let width = 50.0
    var body: some View {
        VStack(spacing: 0) {
            Button {
                print("Change Map")
            } label: {
                Image(systemName: "map.fill")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .padding(15)
                    .frame(width: width, height: width)
            }
            Divider()
            Button {
                print("Find This Device")
            } label: {
                Image(systemName: "location.fill")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .padding(15)
                    .frame(width: width, height: width)
            }
        }
        .background(.thickMaterial)
        .frame(width: width)
        .cornerRadius(13)
    }
}

#Preview {
    DevicesView()
}
