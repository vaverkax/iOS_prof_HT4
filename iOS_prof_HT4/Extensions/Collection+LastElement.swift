//
//  Collection+LastElement.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 22.03.22.
//

import Foundation

extension RandomAccessCollection where Self.Element: Identifiable {
    func isLastItem<Item: Identifiable>(_ item: Item) -> Bool {
        guard isEmpty == false else { return false }
        guard let itemIndex = firstIndex(where: { AnyHashable($0.id) == AnyHashable(item.id) }) else {
            return false
        }
        let distance = self.distance(from: itemIndex, to: endIndex)

        return distance == 1
    }
}
