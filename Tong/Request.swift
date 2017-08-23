//
//  Request.swift
//  Tong
//
//  Created by nori on 2017/08/23.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation
import APIKit

public protocol ElasticSearchRequest: APIKit.Request { }

extension ElasticSearchRequest {
    public var baseURL: URL { return URL(string: Configure.shared.baseURL!)! }
}

public class Request<T: Searchable>: ElasticSearchRequest {

    public typealias Response = Tong.Response<T>

    public var method: HTTPMethod

    public var path: String

    public init(_ method: HTTPMethod, path: String) {
        self.method = method
        self.path = path
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
