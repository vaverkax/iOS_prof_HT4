//
//  BeerViewModel.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 22.03.22.
//

import Foundation
import NetworkingModule
import Combine

class BeerViewModel: BaseViewModel {
    @Injected var logService: LogService
    @Published var list: [Beer] = []
    @Published var selectedItem: Int? = nil
    @Published var isRequestFailed = false
    @Published var fetching = false
    var canLoadMore: Bool = true
    var isFirstLoad: Bool = true
    
    private var page: Int = 1
    var cancellable = Set<AnyCancellable>()
    
    func setItemSelected(beer: Beer) {
        if let index = list.firstIndex(where: { $0.id == beer.id }) {
            self.selectedItem = index
        }
    }
    
    func getSelectedBeer() -> Beer? {
        guard let selectedItem = selectedItem else { return nil }
        return list[selectedItem]
    }
    
    func fetchBeers() {
        guard canLoadMore else { return }
        logService.log("Fetching beers", metaData: ["" : ""])
        
        canLoadMore = false
        fetching = true
        BeerAPI.getBeersFuture(page: page)
            .sink { [weak self] completion in
                guard let strongSelf = self else { return }
                switch completion {
                case .failure(let error):
                    strongSelf.isRequestFailed = true
                    strongSelf.fetching = false
                    print(error.localizedDescription)
                case .finished:
                    print("finished")
                    strongSelf.fetching = false
                    strongSelf.isFirstLoad = false
                }
            } receiveValue: { [weak self]  dataList in
                guard let strongSelf = self else { return }
                strongSelf.list.append(contentsOf: dataList)
                strongSelf.page += 1
                strongSelf.canLoadMore = true
            }
            .store(in: &cancellable)
    }
    
    deinit {
        for cancellable in cancellable {
            cancellable.cancel()
        }
    }
}
