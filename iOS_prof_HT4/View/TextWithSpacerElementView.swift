//
//  TextWithSpacerElementView.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 3.04.22.
//

import SwiftUI

struct TextWithSpacerElementView: View {
    var textTitle: String
    var body: some View {
        Spacer()
        Text(textTitle)
            .font(.headline)
    }
}
