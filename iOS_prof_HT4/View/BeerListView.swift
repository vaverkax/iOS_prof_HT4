//
//  BeerListView.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 30.03.22.
//

import SwiftUI
import NetworkingModule

struct BeerListView: View {
    @EnvironmentObject private var viewModel: BeerViewModel
    @EnvironmentObject var navigationModel: NavigationControllerViewModel
    @State var isAnimationOn: Bool = false
    
    var body: some View {
        List {
            ForEach(viewModel.list, id: \.id) { beer in
                let isLastCharacter = viewModel.list.isLastItem(beer)
                Text(beer.name ?? " empty name")
                    .onTapGesture {
                        isAnimationOn.toggle()
                        self.onLabelTapped(beer: beer)
                    }
                    .offset(x: isAnimationOn ? 350 : 0, y: isAnimationOn ? 300 : 0)
                    .animation(Animation.timingCurve(0.1, 0.7, 0.2, 0.2, duration: 1),
                               value: isAnimationOn)
                    .onAppear {
                        if isLastCharacter && viewModel.canLoadMore {
                            viewModel.fetchBeers()
                        }
                    }
            }
            if !(viewModel.isFirstLoad) {
                LoaderView(isFailed: viewModel.isRequestFailed)
                                .onAppear(perform: viewModel.fetchBeers)
                                .onTapGesture(perform: onTapLoadView)
            }
        }
        .onAppear {
            if (viewModel.isFirstLoad) {
                viewModel.fetchBeers()
            }
        }
        .overlay {
            if viewModel.fetching && viewModel.isFirstLoad {
                ProgressView("Fetching data, please wait...")
                    .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
            }
        }
    }
    
    private func onLabelTapped(beer: Beer) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            if isAnimationOn {
                isAnimationOn.toggle()
                navigationModel.push(screenView: DetailBeerView(item: beer.description ?? "empty descr").toAnyView())
            }
        }
    }
    
    private func onTapLoadView() {
            if viewModel.isRequestFailed {
                viewModel.isRequestFailed = false
                viewModel.fetchBeers()
            }
        }
}

struct BeerListView_Previews: PreviewProvider {
    static var previews: some View {
        BeerListView()
    }
}
