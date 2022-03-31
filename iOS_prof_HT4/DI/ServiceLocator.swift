//
//  ServiceLocator.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 31.03.22.
//

import Foundation

class ServiceLocator: NSObject {
    private var services = [String: Any]()
    
    static let shared = ServiceLocator()
    
    func addService<T:Any>(service: T) {
        let serviceType = String(describing: T.self)
        services[serviceType] = service
    }
    
    func getService<T:Any>(type: T.Type)->T? {
        let serviceType = String(describing: T.self)
        return services[serviceType ] as? T
    }
}
