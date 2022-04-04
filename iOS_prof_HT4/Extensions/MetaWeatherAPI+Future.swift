//
//  MetaWeatherAPI+Future.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 30.03.22.
//

import Foundation
import NetworkingModule
import Combine

extension MetaWeatherAPI {
    open class func getForercast(woed: Int) -> Deferred<Future<Forecast?,Error>> {
        return Deferred {
            Future { promise in
                self.locationWoeidGet(woeid: woed) { data, error in
                    if let error = error {
                        promise(.failure(error))
                    } else {
                        promise(.success(data ?? nil))
                    }
                }
            }
        }
    }
    
    open class func getLocation(name: String) -> Deferred<Future<[Location],Error>> {
        return Deferred {
            Future { promise in
                self.locationSearchGet(query: name) { data, error in
                    if let error = error {
                        promise(.failure(error))
                    } else {
                        promise(.success(data ?? []))
                    }
                }
            }
        }
    }
    
    open class func getImagePath(weather: String) -> String {
        return OpenAPIClientAPI.basePath3 + "/static/img/weather/png/\(weather).png"
    }
}
