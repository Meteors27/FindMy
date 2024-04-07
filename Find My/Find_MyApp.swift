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
    var tabWindow: UIWindow?
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
}

class PassThroughWindow: UIWindow {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard let view = super.hitTest(point, with: event) else { return nil }
        return view == rootViewController?.view ? nil : view
    }
}
