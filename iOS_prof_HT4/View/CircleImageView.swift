//
//  CircleImageView.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 31.03.22.
//

import SwiftUI

struct CircleImageView: View {
    var image: AsyncImage<_ConditionalContent<AnyView, ProgressView<EmptyView, EmptyView>>>

    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}
