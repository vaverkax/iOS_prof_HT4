//
//  LogService.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 11.04.22.
//

import Foundation

protocol LogServiceProtocol {
    func log(_ event: String, metaData: [String: Any])
}

struct LogService: LogServiceProtocol {
    func log(_ event: String, metaData: [String : Any]) {
        print("This should send the event to firebase or somewhere")
    }
}
