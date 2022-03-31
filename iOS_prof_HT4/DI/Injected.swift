//
//  Injected.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 31.03.22.
//

import Foundation

@propertyWrapper
struct Injected<T> {
    
    var value: T!
    
    init() {
        value = ServiceLocator.shared.getService(type: T.self)
    }
    
    var wrappedValue: T {
        get {
            return DependencyProvider.getDependency(T.self)
        }
        set {
            value = newValue
            ServiceLocator.shared.addService(service: value)
        }
    }
}
