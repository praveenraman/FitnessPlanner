//
//  Fitness_PlannerApp.swift
//  Fitness Planner
//
//  Created by Praveen Kumar on 06/11/24.
//

import SwiftUI
import UIKit
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
}

@main
struct Fitness_PlannerApp: App {
    
    //MARK: - Register app  delegate for firbase setup
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var authViewModel = AuthViewModel()
    @ObservedObject private var router = Router()
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
//            NavigationStack(path: $router.navPath) {
//                ContentView()
//                    .navigationDestination(for: Router.AuthFlow.self) { destination in
//                        switch destination{
//                        case .login: LoginView()
//                        case .createAccount: CreateAccountView()
//                        case .profile: ProfileView()
//                        case .forgotPassword: ForgotPassword()
//                        case .emailSent: SuccessView()
//                            
//                        }
//                    }
//            }
            .environmentObject(authViewModel)
            //.environmentObject(router)
        }
        
    }
}

