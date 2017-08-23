//
//  Searchable.swift
//  Tong
//
//  Created by nori on 2017/08/23.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation
import APIKit
import Result
import ElastiQ

public protocol Searchable {

    var _index: String { get }

    var _type: String { get }

    var _path: String { get }
}

extension Searchable {

    public typealias Request = Tong.Request<Self>

    public typealias Response = Request.Response

    public var _path: String {
        return "\(_index)/\(_type)/_search"
    }

    public func search(query: ElastiQ, block: @escaping (Result<Response, SessionTaskError>) -> Void) {
        let request: Request = Request(.get, path: _path)
        Session.send(request, callbackQueue: .main, handler: block)
    }
}
