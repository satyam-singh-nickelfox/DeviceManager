//
//  BarCodeScannerProjectApp.swift
//  BarCodeScannerProject
//
//  Created by Satyam Singh on 09/07/24.
//

import SwiftUI
import FirebaseCore

@main
struct BarCodeScannerProjectApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ScannerView()
        }
    }
}

//MARK: AppDelegate
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        print("Firebase Configured!")
        
        return true
    }
}
