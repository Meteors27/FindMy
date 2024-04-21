//
//  Devices.swift
//  Find My
//
//  Created by william on 2024/4/14.
//

import Foundation
import MapKit


enum Device: String {
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
    
    fileprivate func regionWithPortion(_ center: CLLocationCoordinate2D, verticalPortion: Double = 0.5, span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)) -> MKCoordinateRegion {
        return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: center.latitude + span.latitudeDelta * (verticalPortion - 0.5) * 2, longitude: center.longitude), span: span)
    }
    
    var region: MKCoordinateRegion {
        switch self {
        case .iphone:
            return regionWithPortion(.iphone, verticalPortion: 0.25)
        case .airpodspro:
            return regionWithPortion(.airpodspro, verticalPortion: 0.25)
        case .applewatch:
            return regionWithPortion(.applewatch, verticalPortion: 0.25)
        case .ipad:
            return regionWithPortion(.ipad, verticalPortion: 0.25)
        }
    }
}

extension CLLocationCoordinate2D {
    static let iphone = CLLocationCoordinate2D(latitude: 30.268026, longitude: 120.123328)
    static let airpodspro = CLLocationCoordinate2D(latitude: 30.263897, longitude: 120.124665)
    static let applewatch = CLLocationCoordinate2D(latitude: 30.263097, longitude: 120.124065)
    static let ipad = CLLocationCoordinate2D(latitude: 30.264130, longitude: 120.120228)
}
