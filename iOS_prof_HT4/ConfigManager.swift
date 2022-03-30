//
//  ConfigManager.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 30.03.22.
//

import Foundation
import SwiftUI

class ConfigManager {
    static let shared = ConfigManager()
    
    lazy var router: TabRouter = {
        return TabRouter()
    }()
    
    lazy var navigationModel: NavigationControllerViewModel = {
        return NavigationControllerViewModel()
    }()
}
