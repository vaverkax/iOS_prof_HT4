//
//  DailyForecastView.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 30.03.22.
//

import SwiftUI
import NetworkingModule

struct DailyForecastView: View {
    
    var dailyForecast: ForecastConsolidatedWeather
    var parentForecast: Forecast
    
    @ObservedObject private var viewModel: WeatherViewModel = DependencyProvider.getDependency()
    @ObservedObject var routeModel: NavigationControllerViewModel = DependencyProvider.getDependency()
    
    var body: some View {
        VStack {
            if let coordinate = parentForecast.lattLong {
                MapView(coordinate: coordinate.parseToCoordinates())
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 300)
                    .onTapGesture {
                        routeModel.push(screenView: FullScreenMapView(coordinate: coordinate.parseToCoordinates()).toAnyView())
                    }
                if let abriv = dailyForecast.weatherStateAbbr {
                    CircleImageView(image: AsyncImage(url: URL(string: viewModel.getImagePath(weather: abriv))) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .toAnyView()
                    } placeholder: {
                        ProgressView()
                    })
                        .offset(y: -130)
                        .padding(.bottom, -130)
                        .frame(width: 200, height: 200)
                }
                
                VStack(alignment: .leading) {
                    Text(parentForecast.title ?? "City")
                        .font(.title)
                    
                    HStack {
                        Text("Min temp: \(dailyForecast.minTemp ?? 0.0)")
                        Spacer()
                        Text("Max temp: \(dailyForecast.maxTemp ?? 0.0)")
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    Divider()
                    
                    Text("On a \(dailyForecast.applicableDate ?? "Today")")
                        .font(.title2)
                    Text(dailyForecast.weatherStateName ?? "Weather")
                }
                .padding()
                
                Spacer()
            } else {
                EmptyView()
            }
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button("Back") {
                    routeModel.pop()
                }
                .font(.title)
            }
        }
    }
}
