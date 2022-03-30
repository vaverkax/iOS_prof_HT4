//
//  FullScreenMapView.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 30.03.22.
//

import SwiftUI
import MapKit

struct FullScreenMapView: View {
    var coordinate: CLLocationCoordinate2D?
    @EnvironmentObject var routeModel: NavigationControllerViewModel
    
    var body: some View {
        VStack {
            MapView(coordinate: coordinate)
        }.toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button("Back") {
                    routeModel.pop()
                }
                .font(.title)
            }
            ToolbarItem(placement: .bottomBar) {
                Button("Back To Home") {
                    routeModel.popToRoot()
                }
                .font(.title)
            }
        }
    }
}
