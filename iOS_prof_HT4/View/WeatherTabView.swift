//
//  WeatherTabView.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 30.03.22.
//

import SwiftUI

struct WeatherTabView: View {
    @EnvironmentObject private var viewModel: WeatherViewModel
    @EnvironmentObject var navigationModel: NavigationControllerViewModel

    var body: some View {
        List {
            if let forecast = viewModel.forecast {
                Text(forecast.title ?? "Empty city")
                    .padding()
                    .font(.title)
                if let consolidatedWeather = forecast.consolidatedWeather {
                    ForEach(consolidatedWeather, id: \.id) { weather in
                        Text("Forecast on date: \(weather.applicableDate ?? "Empty date")")
                            .onTapGesture {
                                navigationModel.push(screenView: DailyForecastView(dailyForecast: weather, parentForecast: forecast).toAnyView())
                            }
                    }
                } else { EmptyView() }
            } else {
                EmptyView()
                
            }
        }
        .onAppear {
            viewModel.fetchForecast()
        }
    }
}

struct SecondTabView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherTabView()
    }
}
