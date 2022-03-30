//
//  ContentView.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 22.03.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var beerViewModel = BeerViewModel()
    @ObservedObject var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        NavigationContainerView(transition: .custom(.slide), content: {
            MainTabView()
                .environmentObject(ConfigManager.shared.router)
                .environmentObject(beerViewModel)
                .environmentObject(weatherViewModel)
        }).environmentObject(ConfigManager.shared.navigationModel)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
