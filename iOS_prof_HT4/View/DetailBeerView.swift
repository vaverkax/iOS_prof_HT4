//
//  DetailBeerView.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 30.03.22.
//

import SwiftUI

struct DetailBeerView: View {
    var item: String
    @EnvironmentObject var routeModel: NavigationControllerViewModel
    
    var body: some View {
        VStack {
            Text(item)
            Button {
                self.routeModel.pop()
            } label: {
                Text("Back").frame(height: 50)
            }
        }.padding()
        
        Spacer()
    }
}
