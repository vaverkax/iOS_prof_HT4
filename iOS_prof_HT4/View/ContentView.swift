//
//  ContentView.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 22.03.22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationContainerView(transition: .custom(.slide), content: {
            MainTabView()
        })
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
