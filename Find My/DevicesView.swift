//
//  DevicesView.swift
//  Find My
//
//  Created by william on 2024/4/5.
//

import SwiftUI
import MapKit

struct DevicesView: View {
    @State var isSheetPresented = true
    @State var selectedDetent: PresentationDetent = .large
//    let heights = stride(from: 0.1, to: 1.0, by: 0.1).map { PresentationDetent.fraction($0) }
    var body: some View {
        ZStack {
            Map()
        }
    }
}

#Preview {
    DevicesView()
}
