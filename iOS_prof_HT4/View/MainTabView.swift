//
//  MainTabView.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 30.03.22.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var router: TabRouter
    
    var body: some View {
        VStack {
            Picker("Tab selection", selection: $router.tabSelection) {
                Text("Beer").tag(0)
                Text("Weather").tag(1)
            }.pickerStyle(.segmented)
                .padding()
            Spacer()
            NavigationContainerView(transition: .custom(.slide
                                                            .combined(with: .move(edge: .leading))
                                                            .combined(with: .opacity)
                                                       ), content: {
                switch router.tabSelection {
                case 0:
                    BeerListView()
                case 1:
                    WeatherTabView()
                default:
                    EmptyView()
                }
            })
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
