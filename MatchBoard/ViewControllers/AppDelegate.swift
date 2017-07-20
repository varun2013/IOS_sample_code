//
//  AppDelegate.swift
//  MatchBoard
//
//  Created by Talentelgia on 02/02/16.
//  Copyright © 2016 Talentelgia. All rights reserved.
//

import UIKit
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        
        UINavigationBar.appearance().setBackgroundImage(UIImage(named: "SegCtrl-normal"), forBarMetrics:.Default)
        
        UINavigationBar.appearance().backgroundColor = UIColor.clearColor()
        
        UINavigationBar.appearance().translucent = false
        
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        
        // Facebook Method.
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        return true
        
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
         FBSDKAppEvents.activateApp()

    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        //Even though the Facebook SDK can make this determinitaion on its own,
        //let's make sure that the facebook SDK only sees urls intended for it,
        //facebook has enough info already!
//        let isFacebookURL = url.scheme != nil && url.scheme.hasPrefix("fb\(FBSDKSettings.appID())") && url.host == "authorize"
//        if isFacebookURL {
            return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    //    }
      //  return false
    }

}

