//
//  Tab.swift
//  Find My
//
//  Created by william on 2024/4/5.
//

enum Tab: String, CaseIterable {
    case people = "figure.2"
    case devices = "macbook.and.iphone"
    case items = "circle.grid.2x2.fill"
    case me = "person.crop.circle.fill"
    
    var title: String {
        switch self {
        case .people:
            return "People"
        case .devices:
            return "Devices"
        case .items:
            return "Items"
        case .me:
            return "Me"
        }
    }
}
