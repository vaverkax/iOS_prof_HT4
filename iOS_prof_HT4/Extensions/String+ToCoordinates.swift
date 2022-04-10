//
//  String+ToCoordinates.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 30.03.22.
//

import Foundation
import CoreLocation

extension String {
    func parseToCoordinates() -> CLLocationCoordinate2D? {
        if self.firstIndex(of: ",") != nil {
            let arrayOfSubstrings = self.split(separator: ",")
            return CLLocationCoordinate2D(latitude: Double(arrayOfSubstrings[0]) ?? 0.0,
                                          longitude: Double(arrayOfSubstrings[1]) ?? 0.0)
        } else {
            return nil
        }
    }
}
