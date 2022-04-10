//
//  BeerAPI+Future.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 30.03.22.
//

import Foundation
import NetworkingModule
import Combine

extension BeerAPI {
    open class func getBeersFuture(page: Int) -> Deferred<Future<[Beer], Error>> {
        return Deferred {
            Future { promise in
                self.beersGet(page: page) { beerList, error in
                    if let error = error {
                        promise(.failure(error))
                    } else {
                        promise(.success(beerList ?? []))
                    }
                }
            }
        }
    }

    open class func getBeerById(id: Int) -> Future<Beer, Error> {
        return Future { promise in
            self.beersBeerIdGet(beerId: id) { beer, error in
                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success(beer ?? Beer()))
                }
            }
        }
    }
}
