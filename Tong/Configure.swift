//
//  Configure.swift
//  Tong
//
//  Created by nori on 2017/08/23.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

public class Configure {

    public var isEncrypted: Bool

    public var url: String

    public var user: String

    public var password: String

    public static var shared: Configure!

    public class func setup(url: String, user: String, password: String, isEncrypted: Bool = true) {
        Configure.shared = Configure(url: url, user: user, password: password, isEncrypted: isEncrypted)
    }

    private init(url: String, user: String, password: String, isEncrypted: Bool = true) {
        self.isEncrypted = isEncrypted
        self.url = url
        self.user = user
        self.password = password
        Configure.shared = self
    }
}
