//
//  Location+Identifiable.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 29.03.22.
//
import Foundation
import NetworkingModule

extension Location: Identifiable {
    public var id: Double { woeid ?? Double(UUID().hashValue) }
}
