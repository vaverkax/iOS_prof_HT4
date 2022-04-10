//
//  DetatilDailyForecastView.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 3.04.22.
//

import SwiftUI
import NetworkingModule

struct DetatilDailyForecastView: View {
    var dailyForecast: ForecastConsolidatedWeather
    var parentForecast: Forecast
    @EnvironmentObject var routeModel: NavigationControllerViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            Text(parentForecast.title ?? "City")
                .font(.largeTitle)
            HStack {
                Text("Min temperature: \(dailyForecast.minTemp ?? 0.0)")
                Spacer()
                Text("Max temperature: \(dailyForecast.maxTemp ?? 0.0)")
            }
            .padding()
            .font(.subheadline)
            .foregroundColor(.secondary)
            TextWithSpacerElementView(textTitle: "Avarage temperature: \(dailyForecast.theTemp ?? 0.0)")
            TextWithSpacerElementView(textTitle: "Wind Speed: \(dailyForecast.windSpeed ?? 0.0)")
            TextWithSpacerElementView(textTitle: "Air pressure: \(dailyForecast.airPressure ?? 0.0)")
            VStack {
                TextWithSpacerElementView(textTitle: "Humidity: \(dailyForecast.humidity ?? 0.0)")
                TextWithSpacerElementView(textTitle: "Wind direction: \(dailyForecast.windDirectionCompass ?? "S")")
                Spacer()
                HStack {
                    Button("Back", action: {
                        routeModel.pop()
                    })
                    Spacer()
                    if let coordinate = parentForecast.lattLong {
                        Button("Open fullscreen map", action: {
                            routeModel.push(screenView: FullScreenMapView(coordinate: coordinate.parseToCoordinates()).toAnyView())
                        })
                    }
                }
            }
            .padding()
        }
    }
}

