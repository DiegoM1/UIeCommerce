//
//  View+extension.swift
//  Ecommerce TechProducts
//
//  Created by Diego Monteagudo Diaz on 27/03/23.
//

import SwiftUI

extension View {
    func filterItemStyle() -> some View {
        modifier(FilterItemModifier())
    }
}
