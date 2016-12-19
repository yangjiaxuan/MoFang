//
//  AppDelegate.swift
//  MoFang
//
//  Created by 杨森 on 16/9/19.
//  Copyright © 2016年 sitemap. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var tabBar : MFTabBarController?
    var rootNav : MoFangNavController?
    
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
       
        window = UIWindow(frame: UIScreen.main.bounds);
        window?.backgroundColor = UIColor.white;
        window?.makeKeyAndVisible();
        
        tabBar  = MFTabBarController();
        let tabBarItem1 : UITabBarItem = UITabBarItem(title: "首页", image: UIImage.init(named: "btn_home_normal_24x24_")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "btn_home_selected_24x24_")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal));
        let tabBarItem2 : UITabBarItem = UITabBarItem(title: "我的", image: UIImage.init(named: "btn_user_normal_24x24_")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "btn_user_selected_24x24_")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal));
        
        let VC1 = MainVC();
        VC1.tabBarItem = tabBarItem1;
        let VCNav1 = MoFangNavController(rootViewController: VC1);
        
        
        let VC2 = MineVC();
        VC2.tabBarItem = tabBarItem2;
        let VCNav2 = MoFangNavController(rootViewController: VC2);
        
        
        tabBar?.viewControllers = [VCNav1, VCNav2];
        rootNav = MoFangNavController(rootViewController: tabBar!);
        
        window?.rootViewController = rootNav;
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

