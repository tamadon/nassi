//
//  AppDelegate.swift
//  nassi
//
//  Created by Hideaki Tamai on 2017/08/06.
//  Copyright © 2017年 tamadon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        loadEnv()
        
        var viewControllers: [UIViewController] = []

        let firstVC = EventViewController.initialViewController()
        let navigationController = UINavigationController(rootViewController: firstVC)
        navigationController.tabBarItem = UITabBarItem(title: "Record", image: UIImage.Asset.ic_mode_edit_36pt, tag: 1)
        viewControllers.append(navigationController)

        let secondVC = YouTubeListViewController.initialViewController()
        secondVC.tabBarItem = UITabBarItem(title: "Movie", image: UIImage.Asset.ic_play_circle_outline_36pt, tag: 2)
        viewControllers.append(secondVC)

        let tabBarController = UITabBarController()
        tabBarController.setViewControllers(viewControllers, animated: false)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func loadEnv() {
        guard let path = Bundle.main.path(forResource: ".env", ofType: nil) else {
            fatalError("Not found: '/path/to/.env'.\nPlease create .env file reference from .env.sample")
        }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let str = String(data: data, encoding: .utf8) ?? "Empty File"
            let clean = str.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "'", with: "")
            let envVars = clean.components(separatedBy:"\n")
            for envVar in envVars {
                let keyVal = envVar.components(separatedBy:"=")
                if keyVal.count == 2 {
                    setenv(keyVal[0], keyVal[1], 1)
                }
            }
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}

