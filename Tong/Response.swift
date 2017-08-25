//
//  Response.swift
//  Tong
//
//  Created by nori on 2017/08/23.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

public struct Response<T: Codable>: Decodable {

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

public struct Hits<T: Codable>: Decodable {

    public typealias Element = Item<T>

    public enum Keys: String, CodingKey {
        case total      = "total"
        case maxScore   = "max_score"
        case hits       = "hits"
    }

    public var total: Int = 0

    public var maxScore: Int? = 0

    public var hits: [Element]

    public init(total: Int, maxScore: Int?, hits: [Element]) {
        self.total = total
        self.maxScore = maxScore
        self.hits = hits
    }

    public init(from decoder: Decoder) throws {
        let container       = try decoder.container(keyedBy: Hits.Keys.self)
        let total: Int      = try container.decode(Int.self, forKey: .total)
        let maxScore: Int?  = try container.decode(Int?.self, forKey: .maxScore)
        let hits: [Element]       = try container.decode([Element].self, forKey: .hits)
        self.init(total: total, maxScore: maxScore, hits: hits)
    }
}

public struct Item<T: Codable>: Decodable {

    public enum Keys: String, CodingKey {
        case _index     = "_index"
        case _type      = "_type"
        case _id        = "_id"
        case _score     = "_score"
        case _source    = "_source"
    }

    public let _index: String

    public let _type: String

    public let _id: String

    public let _score: Int

    public let _source: T

    public init(_index: String, _type: String, _id: String, _score: Int, _source: T) {
        self._index = _index
        self._type = _type
        self._id = _id
        self._score = _score
        self._source = _source
    }

    public init(from decoder: Decoder) throws {
        let container       = try decoder.container(keyedBy: Item.Keys.self)
        let _index: String  = try container.decode(String.self, forKey: ._index)
        let _type: String   = try container.decode(String.self, forKey: ._type)
        let _id: String     = try container.decode(String.self, forKey: ._id)
        let _score: Int     = try container.decode(Int.self, forKey: ._score)
        let _source: T      = try container.decode(T.self, forKey: ._source)
        self.init(_index: _index, _type: _type, _id: _id, _score: _score, _source: _source)
    }
}
