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
        registerForPushNotifications()
        let contentView = ContentView()
        appCoordinator.navigationController!.setViewControllers([UIHostingController(rootView: contentView.environmentObject(appCoordinator))], animated: false)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        
        Branch.enableLogging()
        
        Branch.getInstance().checkPasteboardOnInstall()
        
        Branch.getInstance().initSession(launchOptions: launchOptions, isReferrable: true) { (params, error) in
            print(params as? [String: AnyObject] ?? {})
            // Access and use Branch Deep Link data here (nav to page, display content, etc.)
            guard let data = params as? [String: AnyObject] else { return }
            
            if let navPage = data["nav_to"] as? String, navPage == "movieDetail" {
                self.appCoordinator.push(view: MovieDetailView(id : Int(data["nav_id"] as? String ?? "") ?? 0).environmentObject(movies))
            }
        }
        
        return true

        
//        BranchScene.shared().initSession(launchOptions: launchOptions,isreferra ,registerDeepLinkHandler: { (params, error, scene) in
//
//            guard let data = params as? [String: AnyObject] else { return }
//            
//            if let navPage = data["nav_to"] as? String, navPage == "movieDetail" {
//                self.appCoordinator.push(view: MovieDetailView(id : Int(data["nav_id"] as? String ?? "") ?? 0).environmentObject(movies))
//            }
//     
//        })

    
    //Remote notification - app killed state
    
    if let remoteNotification = launchOptions?[.remoteNotification] as? UILocalNotification {
        // Handle local notification
        DispatchQueue.main.async {
            Branch.getInstance().handlePushNotification(remoteNotification.userInfo)
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
    func registerForPushNotifications() {
        UIApplication.shared.registerForRemoteNotifications()
        let generalCategory = UNNotificationCategory(identifier: "GENERAL",
                               actions: [],
                               intentIdentifiers: [],
                               options: .customDismissAction)
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
          DispatchQueue.main.async {
            UNUserNotificationCenter.current().delegate = self
          }
          UNUserNotificationCenter.current().setNotificationCategories([generalCategory])
        }
      }
    //notification - app background
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if let pushPayload = response.notification.request.content.userInfo as? [String:Any] {
          // Check to see if Branch Link is in payload
          if pushPayload["branch"] != nil {
            Branch.getInstance().handlePushNotification(response.notification.request.content.userInfo)
          } else {
            // Handle Legacy Deep Linking
            print("it's a normal push notif")
          }
        }
      }
//Remote notification - app background
    
 func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
      // Handler for Push Notifications
     //Branch.getInstance().handlePushNotification()
    }
}
