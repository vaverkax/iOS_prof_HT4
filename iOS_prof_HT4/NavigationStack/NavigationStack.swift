//
//  NavigationStack.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 25.03.22.
//

import Foundation

struct NavigationStack {
    private var screens = [Screen]()
    
    mutating func push(_ s: Screen) {
        self.screens.append(s)
    }
    
    mutating func pop() {
        _ = self.screens.popLast()
    }
    
    mutating func popToRoot() {
        self.screens.removeAll()
    }
    
    mutating func removeLast() {
        if self.screens.count > 0 { self.screens.removeLast() }
    }
    
    func top()->Screen? {
        return self.screens.last
    }
}
