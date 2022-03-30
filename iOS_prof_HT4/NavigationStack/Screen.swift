//
//  Screen.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 25.03.22.
//
import Foundation
import SwiftUI


struct Screen: Identifiable, Equatable {
    let id = UUID().uuidString
    let view: AnyView
    
    public static func == (lhs: Screen, rhs: Screen)-> Bool {
        return lhs.id == rhs.id
    }
}
