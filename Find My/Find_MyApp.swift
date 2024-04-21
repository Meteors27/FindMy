//
//  Find_MyApp.swift
//  Find My
//
//  Created by william on 2024/4/3.
//

import SwiftUI

@main
struct Find_MyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    var windowSharedModel = WindowSharedModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(windowSharedModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let config = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        config.delegateClass = SceneDelegate.self
        return config
    }
}

@Observable
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    weak var windowScene: UIWindowScene?
    // tabbar window
    var tabWindow: UIWindow?
    // nearby window
    var nearbyWindow: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        windowScene = scene as? UIWindowScene 
    }
    func addTabBar(_ WindowSharedModel: WindowSharedModel) {
        guard let scene = windowScene else { return }
        let tabBarController = UIHostingController(rootView: CustomTabBar().environment(WindowSharedModel).frame(maxHeight: .infinity, alignment: .bottom))
        tabBarController.view.backgroundColor = .clear
        let tabWindow = PassThroughWindow(windowScene: scene)
        tabWindow.rootViewController = tabBarController
        tabWindow.isHidden = false
        self.tabWindow = tabWindow
    }
    // tabbar slide down animation
    func removeTabBar() {
        guard let tabWindow = tabWindow else { return }
        UIView.animate(withDuration: 0.3) {
            tabWindow.frame.origin.y = tabWindow.frame.maxY
        } completion: { _ in
            tabWindow.isHidden = true
        }
    }
    // tabbar slide up animation
    func showTabBar() {
        guard let tabWindow = tabWindow else { return }
        tabWindow.isHidden = false
        UIView.animate(withDuration: 0.3) {
            tabWindow.frame.origin.y = tabWindow.frame.minY
        }
    }
    // nearby window
    func showNearbyWindow(_ WindowSharedModel: WindowSharedModel) {
        guard let scene = windowScene else { return }
        let nearbyController = UIHostingController(rootView: NearbyView().environment(WindowSharedModel).environment(self))
        nearbyController.view.backgroundColor = .clear
        // no need to use passthrough window
        let nearbyWindow = UIWindow(windowScene: scene)
        nearbyWindow.rootViewController = nearbyController
        nearbyWindow.isHidden = true
        self.nearbyWindow = nearbyWindow
        nearbyWindow.alpha = 0
        nearbyWindow.isHidden = false
        UIView.animate(withDuration: 0.3) {
            nearbyWindow.alpha = 1
        }
    }
    // nearby window opacity animation
    func removeNearbyWindow() {
        guard let nearbyWindow = nearbyWindow else { return }
        UIView.animate(withDuration: 0.3) {
            nearbyWindow.alpha = 0
        } completion: { _ in
            nearbyWindow.isHidden = true
        }
    }
}

class PassThroughWindow: UIWindow {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard let view = super.hitTest(point, with: event) else { return nil }
        return view == rootViewController?.view ? nil : view
    }
}
