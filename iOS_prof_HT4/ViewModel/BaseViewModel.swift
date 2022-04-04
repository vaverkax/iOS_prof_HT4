//
//  BaseViewModel.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 31.03.22.
//

import Foundation
import NetworkingModule
import Combine

protocol BaseViewModel: ObservableObject {
    var fetching: Bool { get set }
    var isRequestFailed: Bool { get set }
    var isFirstLoad: Bool { get set }
    var cancellable: Set<AnyCancellable> { get set }
}
