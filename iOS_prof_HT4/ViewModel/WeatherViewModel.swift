//
//  WeatherViewModel.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 30.03.22.
//

import Foundation
import NetworkingModule
import Combine

class WeatherViewModel: BaseViewModel {
    @Published var forecast: Forecast? = nil
    @Published var listLocation: [Location] = []
    @Published var woed: Int = 2122265
    @Published var fetching = false
    @Published var isRequestFailed = false

    var isFirstLoad: Bool = true
    
    var cancellable = Set<AnyCancellable>()
    
    func fetchForecast() {
        fetching = true
        MetaWeatherAPI.getForercast(woed: woed)
            .sink(receiveCompletion: { [weak self] completion in
                    guard let strongSelf = self else { return }
                    switch completion {
                    case .failure(let error):
                        strongSelf.isRequestFailed = true
                        strongSelf.fetching = false
                        print(error.localizedDescription)
                    case .finished:
                        print("finished forecast")
                        strongSelf.fetching = false
                        strongSelf.isFirstLoad = false
                    }
            }, receiveValue: { [weak self]  forecast in
                    guard let strongSelf = self else { return }
                    strongSelf.forecast = forecast
            })
            .store(in: &self.cancellable)
    }
    
    func fetchCity(name: String) {
        fetching = true
        MetaWeatherAPI.getLocation(name: name)
            .sink { [weak self] completion in
                guard let strongSelf = self else { return }
                switch completion {
                case .failure(let error):
                    strongSelf.isRequestFailed = true
                    strongSelf.fetching = false
                    print(error.localizedDescription)
                case .finished:
                    print("finished location")
                    strongSelf.fetching = false
                }
            } receiveValue: { [weak self]  locationList in
                guard let strongSelf = self else { return }
                strongSelf.listLocation.append(contentsOf: locationList)
            }
            .store(in: &self.cancellable)

    }
    
    func getImagePath(weather: String) -> String {
        return MetaWeatherAPI.getImagePath(weather: weather)
    }
    
    deinit {
        for cancellable in cancellable {
            cancellable.cancel()
        }
    }
}
