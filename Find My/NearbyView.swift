//
//  NearbyView.swift
//  Find My
//
//  Created by william on 2024/4/4.
//

import SwiftUI

struct NearbyView: View {
    let name = "Aileen Zeigen"
    let distance: Int = 45
    let direction = "ahead"
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("FINDING")
                    .foregroundColor(.white)
                    .font(.subheadline)
                
                Text(name)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .bold()
                Spacer()
                HStack {
                    Text("\(distance)")
                        .font(.system(size: 50, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                    Text("ft")
                        .font(.system(size: 50, weight: .regular, design: .rounded))
                        .foregroundColor(.white.opacity(0.3))
                }
                Text(direction)
                    .font(.system(size: 50, weight: .regular, design: .rounded))
                    .foregroundColor(.white)
                HStack {
                    CircularButton(systemName: "xmark")
                    Spacer()
                    CircularButton(systemName: "message.fill")
                }
                .padding(.horizontal)
            }
            .padding(.all)
        }
    }
}

struct CircularButton: View {
    var systemName: String
    var body: some View {
        Button(action: {
            print("Button tapped!")
        }) {
            Image(systemName: systemName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundColor(.white)
                .padding(20)
                .background(Color.white.opacity(0.3))
                .clipShape(Circle())
        }
    }
}

#Preview {
    NearbyView()
}
