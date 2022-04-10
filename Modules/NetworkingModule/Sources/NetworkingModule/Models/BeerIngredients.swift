//
// BeerIngredients.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct BeerIngredients: Codable, JSONEncodable {

    public var malt: [BeerIngredientsMalt]?
    public var hops: [BeerIngredientsHops]?
    public var yeast: String?

    public init(malt: [BeerIngredientsMalt]? = nil, hops: [BeerIngredientsHops]? = nil, yeast: String? = nil) {
        self.malt = malt
        self.hops = hops
        self.yeast = yeast
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case malt
        case hops
        case yeast
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(malt, forKey: .malt)
        try container.encodeIfPresent(hops, forKey: .hops)
        try container.encodeIfPresent(yeast, forKey: .yeast)
    }
}

