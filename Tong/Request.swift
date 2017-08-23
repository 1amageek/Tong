//
//  Request.swift
//  Tong
//
//  Created by nori on 2017/08/23.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation
import APIKit
import ElastiQ

public protocol ElasticSearchRequest: APIKit.Request { }

extension ElasticSearchRequest {

    private var _authURL: String {
        return "https://\(Configure.shared.user!):\(Configure.shared.password!)@\(Configure.shared.baseURL!)"
    }

    public var baseURL: URL {
        return URL(string: _authURL)!
    }
}

public class Request<T: Searchable>: ElasticSearchRequest {

    public typealias Response = Tong.Response<T>

    public var method: HTTPMethod

    public var path: String

    public var query: Data

    public init(_ method: HTTPMethod, path: String, query: ElastiQ) {
        self.method = method
        self.path = path
        self.query = try! query.json()
    }

    public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard
            let json = object as? [String: AnyObject],
            let response: Response = Response(json: json) else {
                throw ResponseError.unexpectedObject(object)
        }
        return response
    }
}
