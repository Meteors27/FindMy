//
//  WindowSharedModel.swift
//  Find My
//
//  Created by william on 2024/4/7.
//

import SwiftUI

@Observable
class WindowSharedModel {
    var activeTab: Tab = .devices
    var activeDevice: Device? = nil
    var isTabBarVisible: Bool = false
}
