//
//  AppDelegate.swift
//  Saladbar
//
//  Created by nori on 2017/08/28.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import UIKit
import Tong

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        // Tong setup
        Tong.Configure.setup(url: "104.154.161.126/elasticsearch/", user: "user", password: "CG5TngLx", isEncrypted: false)
        return true
    }
}
