//
//  DevicesView.swift
//  Find My
//
//  Created by william on 2024/4/5.
//

import SwiftUI
import MapKit

extension Image {
    func deviceIcon() -> some View {
        self.resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 30, height: 30)
            .padding(8)
            .background(Color("DeviceBackground"))
            .clipShape(Circle())
            .shadow(radius: 8)
    }
}

struct DevicesView: View {
    @Environment(WindowSharedModel.self) private var windowSharedModel
    @State private var position: MapCameraPosition = .automatic
    @State private var selectedTag: String?
    var body: some View {
        ZStack {
            Map(position: $position, selection: $selectedTag) {
                Annotation(Device.iphone.name, coordinate: .iphone) {
                    Image(systemName: Device.iphone.systemName)
                        .deviceIcon()
                }
                .tag(Device.iphone)
                .annotationTitles(.hidden)
                Annotation(Device.airpodspro.name, coordinate: .airpodspro) {
                    Image(systemName: Device.airpodspro.systemName)
                        .deviceIcon()
                }
                .tag(Device.airpodspro)
                .annotationTitles(.hidden)
                Annotation(Device.applewatch.name, coordinate: .applewatch) {
                    Image(systemName: Device.applewatch.systemName)
                        .deviceIcon()
                }
                .tag(Device.applewatch)
                .annotationTitles(.hidden)
                Annotation(Device.ipad.name, coordinate: .ipad) {
                    Image(systemName: Device.ipad.systemName)
                        .deviceIcon()
                }
                .tag(Device.ipad)
                .annotationTitles(.hidden)
            }
            .onChange(of: windowSharedModel.activeDevice) { oldValue, newValue in
                withAnimation {
                    position = .region(newValue.region)
                }
            }
            
            ButtonsView()
                .padding()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .topTrailing)
            
//            NearbyView()
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
                Image(systemName: "location")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .padding(15)
                    .frame(width: width, height: width)
            }
        }
        .background(.regularMaterial)
        .frame(width: width)
        .cornerRadius(13)
    }
}

#Preview {
    DevicesView()
}
