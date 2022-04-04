//
//  DependencyProvider.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 31.03.22.
//

import Foundation


class DependencyProvider {
    public static func getDependency<Service>(_ type: Service.Type = Service.self) -> Service {
        if let service = ServiceLocator.shared.getService(type: Service.self) {
            return service
        } else {
            fatalError()
        }
    }
}
