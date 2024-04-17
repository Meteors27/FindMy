//
//  Devices.swift
//  Find My
//
//  Created by william on 2024/4/14.
//

import Foundation
import MapKit


enum Device: String{
    case iphone = "iphone"
    case airpodspro = "airpodspro"
    case applewatch = "applewatch"
    case ipad = "ipad"
    
    var name: String {
        switch self {
        case .iphone:
            return "William's iPhone 15 Pro"
        case .airpodspro:
            return "William's AirPods Pro"
        case .applewatch:
            return "William's Apple Watch"
        case .ipad:
            return "William's iPad Pro"
        }
    }
    
    var description: String {
        switch self {
        case .iphone:
            return "This iPhone"
        case .airpodspro:
            return "location 1"
        case .applewatch:
            return "location 2"
        case .ipad:
            return "location 3"
        }
    }
    
    var systemName: String {
        switch self {
        case .iphone:
            return "iphone"
        case .airpodspro:
            return "airpodspro"
        case .applewatch:
            return "applewatch"
        case .ipad:
            return "ipad"
        }
    }
    
    var coordinate: CLLocationCoordinate2D {
        switch self {
        case .iphone:
            return .iphone
        case .airpodspro:
            return .airpodspro
        case .applewatch:
            return .applewatch
        case .ipad:
            return .ipad
        }
    }
    
    var region: MKCoordinateRegion {
        switch self {
        case .iphone:
            return MKCoordinateRegion(center: .iphone, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        case .airpodspro:
            return MKCoordinateRegion(center: .airpodspro, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        case .applewatch:
            return MKCoordinateRegion(center: .applewatch, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        case .ipad:
            return MKCoordinateRegion(center: .ipad, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        }
    }
}

extension CLLocationCoordinate2D {
    static let iphone = CLLocationCoordinate2D(latitude: 30.268026, longitude: 120.123328)
    static let airpodspro = CLLocationCoordinate2D(latitude: 30.263897, longitude: 120.124665)
    static let applewatch = CLLocationCoordinate2D(latitude: 30.263097, longitude: 120.124065)
    static let ipad = CLLocationCoordinate2D(latitude: 30.264130, longitude: 120.120228)
}
