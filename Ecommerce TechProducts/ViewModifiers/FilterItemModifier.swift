//
//  FilterItemModifier.swift
//  Ecommerce TechProducts
//
//  Created by Diego Monteagudo Diaz on 27/03/23.
//

import SwiftUI

struct FilterItemModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(6)
            .background(
                RoundedRectangle(
                    cornerRadius: 6,
                    style: .continuous
                )
                .stroke(.black.opacity(0.1), lineWidth: 1)
            )
    }
}
