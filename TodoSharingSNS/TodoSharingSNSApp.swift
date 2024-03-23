//
//  TodoSharingSNSApp.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/03/16.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct TodoSharingSNSApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var userManager = UserManager()
    
    var body: some Scene {
        WindowGroup {
            // ログイン状態によって画面遷移するページを変更する
            if self.userManager.isAuthenticated {
                HomeView(userManager: self.userManager)
            } else {
                SignInView(userManager: self.userManager)
            }
        }
    }
}
