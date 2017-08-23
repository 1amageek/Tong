//
//  Response.swift
//  Tong
//
//  Created by nori on 2017/08/23.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

public class Response<T: Searchable> {

    public typealias Element = T

    public var took: Int = 0

    public var timedOut: Bool = false

    public var _shards: [AnyHashable: Int] = [:]

    public var hits: Hits<Element>

    public init?(json: Any) {
        self.hits = Hits(total: 0, maxScore: 0, hits: [])
    }
}

public struct Hits<T: Searchable> {

    public var total: Int = 0

    public var maxScore: Int = 0

    public var hits: [T]
}
