//
//  ConfigManager.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 30.03.22.
//

import Foundation
import SwiftUI
import NetworkingModule

class ConfigManager {
    static let shared = ConfigManager()
    
    func configDI() {
        ServiceLocator.shared.addService(service: TabRouter())
        ServiceLocator.shared.addService(service: NavigationControllerViewModel())
        ServiceLocator.shared.addService(service: BeerViewModel())
        ServiceLocator.shared.addService(service: WeatherViewModel())
    }
}
