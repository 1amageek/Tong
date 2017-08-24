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
        let HTTPProtocol: String = Configure.shared.isEncrypted ? "https" : "http"
        return "\(HTTPProtocol)://\(Configure.shared.user):\(Configure.shared.password)@\(Configure.shared.url)"
    }

    public var baseURL: URL {
        return URL(string: _authURL)!
    }
}

public class Request<T: Searchable>: ElasticSearchRequest {

    public typealias Response = Tong.Response<T>

    public var method: HTTPMethod

    public var path: String

    public var query: ElastiQ

    public var parameters: Any? {
        return JSONBodyParameters(JSONObject: query.body)
    }

    public init(_ method: HTTPMethod, path: String, query: ElastiQ) {
        self.method = method
        self.path = path
        self.query = query
    }

    public var dataParser: DataParser {
        return ElastiSearchDataParser()
    }

    public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let data: Data = object as? Data else {
            throw ResponseError.unexpectedObject(object)
        }
        return try JSONDecoder().decode(Response.self, from: data)
    }
}

public struct ElastiSearchDataParser: DataParser {

    public var contentType: String? {
        return "application/json"
    }

    public func parse(data: Data) throws -> Any {
        return data
    }
}
