//
//  User.swift
//  Saladbar
//
//  Created by nori on 2017/08/23.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation
import Tong

class Post: NSObject, Searchable {

    static var _index: String {
        return "v1"
    }

    static var _type: String {
        return "post"
    }
}
