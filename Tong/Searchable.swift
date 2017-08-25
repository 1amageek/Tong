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
//import ElastiQ

public protocol Searchable {

    static var _index: String { get }

    static var _type: String { get }

    static var _path: String { get }
}

extension Searchable where Self: Codable {

    public typealias Request = Tong.Request<Self>

    public typealias Response = Request.Response

    public static var _path: String {
        return "\(Self._index)/\(Self._type)/_search"
    }

//    @discardableResult
//    public static func search(query: ElastiQ, block: @escaping (Result<Response, SessionTaskError>) -> Void) -> SessionTask? {
//        return Self.search(query: query.body, block: block)
//    }

    @discardableResult
    public static func search(query: Any, block: @escaping (Result<Response, SessionTaskError>) -> Void) -> SessionTask? {
        let request: Request = Request(.post, path: _path, query: query)
        return Session.send(request, callbackQueue: .main, handler: block)
    }
}
