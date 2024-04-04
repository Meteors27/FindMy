//
//  OnBoardingView.swift
//  Find My
//
//  Created by william on 2024/4/3.
//

import SwiftUI

struct OnBoardingView: View {
    @Binding var isPresented: Bool
    var body: some View {
        VStack {
            Text("What's New in\nFind My")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.vertical, 40)
            FeatureView(title: "Findable When Powered Off", description: "The Find My network will allow you to locate your iPhone when it's lost, erased, in power reserve mode, or even powered off. ", imageName: "location.fill.viewfinder")
            FeatureView(title: "Find My nwtword for AirPods", description: "Your AirPods are more Findable than ever with support for finding individual earbuds on a map. ", imageName: "airpodspro")
            FeatureView(title: "Refreshed Map", description: "Tap locations on the updated map to open the Maps app. ", imageName: "map")
            Spacer()
            Image(systemName: "person.2.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35)
                .foregroundColor(Color.blue)
            let url = ""
            Text("Locate, lock, or erase tgus device and supported accessories. This device cannot be erased and reactivated without your password.  [See how your data is managed...](\(url))")
                .font(.caption)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            Button(action: {
                print("Button Tapped")
                isPresented = false
            })
            {
                Text("Continue")
                    .font(.headline)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
            .padding(.vertical)
            // TODO: buttonstyle
        }
        .padding(.horizontal)
    }
}

struct OnBoardingView_Previews: View {
    @State var isPresented = true
    var body: some View {
        OnBoardingView(isPresented: $isPresented)
    }
}

#Preview {
    OnBoardingView_Previews()
}

struct FeatureView: View {
    var title: String
    var description: String
    var imageName: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.blue)
                .frame(width: 35, height: 35)
                .padding()
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(description)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.bottom)
    }
}

