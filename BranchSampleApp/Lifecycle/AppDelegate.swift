//
//  AppDelegate.swift
//  BranchSampleApp
//
//  Created by Yashwanthi Manchala on 21/01/24.
//

import UIKit
import BranchSDK
import SwiftUI

let movies: MovieViewModel = MovieViewModel()

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    var window: UIWindow?
    
    private lazy var navigationController = UINavigationController()
    
    lazy var appCoordinator: AppCoordinator = {
        return AppCoordinator(navigationController: navigationController)
    }()
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let contentView = ContentView()
        appCoordinator.navigationController!.setViewControllers([UIHostingController(rootView: contentView.environmentObject(appCoordinator))], animated: false)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        
        Branch.enableLogging()
        Branch.setUseTestBranchKey(true)
        
        Branch.getInstance().checkPasteboardOnInstall()
        
        Branch.getInstance().initSession(launchOptions: launchOptions) { (params, error) in
            print(params as? [String: AnyObject] ?? {})
            // Access and use Branch Deep Link data here (nav to page, display content, etc.)
            guard let data = params as? [String: AnyObject] else { return }
            
            if let navPage = data["nav_to"] as? String, navPage == "movieDetail" {
                self.appCoordinator.push(view: MovieDetailView(id : Int(data["nav_id"] as? String ?? "") ?? 0).environmentObject(movies))
            }
        }
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        Branch.getInstance().application(app, open: url, options: options)
        return true
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
          // Handler for Universal Links
        Branch.getInstance().continue(userActivity)
        return true
    }
//Remote notification
    
 func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
      // Handler for Push Notifications
     Branch.getInstance().handlePushNotification(userInfo)
    }
}
