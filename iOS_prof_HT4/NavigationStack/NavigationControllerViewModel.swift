//
//  NavigationControllerViewModel.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 30.03.22.
//

import Foundation
import SwiftUI

class NavigationControllerViewModel : ObservableObject {
    @Published var currentScreen: Screen?
    var navigationType: NavigationType = .push
    
    var screenStack = NavigationStack() {
        didSet {
            self.currentScreen = screenStack.top()
        }
    }
    
    func push(screenView: AnyView) {
        self.navigationType = .push
        let screen = Screen(view: screenView)
        screenStack.push(screen)
    }
    
    func pop() {
        self.navigationType = .pop
        screenStack.pop()
    }
    
    func popToRoot() {
        self.navigationType = .popToRoot
        screenStack.popToRoot()
    }
}
