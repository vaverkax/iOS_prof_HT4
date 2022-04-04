//
//  BeerItemCellView.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 7.04.22.
//

import SwiftUI
import NetworkingModule

struct BeerItemCellView: View {
    let beer: Beer
    
    var body: some View {
        Text(beer.name ?? " empty name")
    }
}
