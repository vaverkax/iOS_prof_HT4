//
//  MapView.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 30.03.22.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D?
    @State private var region = MKCoordinateRegion()

    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate ?? CLLocationCoordinate2D())
            }
    }

    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}
