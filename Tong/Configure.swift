//
//  Configure.swift
//  Tong
//
//  Created by nori on 2017/08/23.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

public class Configure {

    public var user: String?

    public var password: String?

    public var baseURL: String?

    public static let shared: Configure = Configure()

    public class func configure(user: String, password: String, baseURL: String) {
        shared.user = user
        shared.password = password
        shared.baseURL = baseURL
    }
}
