//
//  NavigationContainerView.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 30.03.22.
//

import Foundation
import SwiftUI

struct NavigationContainerView<Content: View>: View {
    @EnvironmentObject var viewModel: NavigationControllerViewModel
    private let content: Content
    private let animation: Animation = .easeInOut(duration: 0.3)
    private let transition: (push: AnyTransition, pop: AnyTransition)
    
    init(transition: Transition, @ViewBuilder content: @escaping ()-> Content) {
        self.content = content()
        switch transition {
        case .none:
            self.transition = (.identity , .identity)
        case .custom(let transition):
            self.transition = (transition, transition)
        }
        
    }
    
    var body: some View {
        let isRoot = viewModel.currentScreen == nil
        return ZStack {
            if isRoot {
                self.content.environmentObject(self.viewModel)
                    .animation(animation)
                    .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
            } else {
                viewModel.currentScreen?.view.environmentObject(self.viewModel)
                    .animation(animation)
                    .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
            }
        }
    }
}
