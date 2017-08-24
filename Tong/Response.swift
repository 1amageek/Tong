//
//  Response.swift
//  Tong
//
//  Created by nori on 2017/08/23.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

public struct Response<T: Searchable>: Decodable {

    public typealias Element = T

    public enum Keys: String, CodingKey {
        case took       = "took"
        case timedOut   = "timed_out"
        case _shards    = "_shards"
        case hits       = "hits"
    }

    public let took: Int

    public let timedOut: Bool

    public let _shards: Shards

    public let hits: Hits<Element>

    public init(took: Int, timedOut: Bool, _shards: Shards, hits: Hits<Element>) {
        self.took = took
        self.timedOut = timedOut
        self._shards = _shards
        self.hits = hits
    }

    public init(from decoder: Decoder) throws {
        let container           = try decoder.container(keyedBy: Response.Keys.self)
        let took: Int           = try container.decode(Int.self, forKey: .took)
        let timedOut: Bool      = try container.decode(Bool.self, forKey: .timedOut)
        let _shards: Shards     = try container.decode(Shards.self, forKey: ._shards)
        let hits: Hits<Element> = try container.decode(Hits<Element>.self, forKey: .hits)
        self.init(took: took, timedOut: timedOut, _shards: _shards, hits: hits)
    }
}

public struct Shards: Decodable {
    let failed: Int = 0
    let successful: Int = 0
    let total: Int = 5
}

public struct Hits<T: Searchable>: Decodable {

    public enum Keys: String, CodingKey {
        case total      = "total"
        case maxScore   = "max_score"
        case hits       = "hits"
    }

    public var total: Int = 0

    public var maxScore: Int = 0

    public var hits: [T]

    public init(total: Int, maxScore: Int, hits: [T]) {
        self.total = total
        self.maxScore = maxScore
        self.hits = hits
    }

    public init(from decoder: Decoder) throws {
        let container       = try decoder.container(keyedBy: Hits.Keys.self)
        let total: Int      = try container.decode(Int.self, forKey: .total)
        let maxScore: Int   = try container.decode(Int.self, forKey: .maxScore)
        let hits: [T]       = try container.decode([T].self, forKey: .hits)
        self.init(total: total, maxScore: maxScore, hits: hits)
    }
}
