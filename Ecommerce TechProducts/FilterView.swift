//
//  FilterView.swift
//  Ecommerce TechProducts
//
//  Created by Diego Monteagudo Diaz on 27/03/23.
//

import SwiftUI


struct FilterView: View {
    var items: [FilterItemProtocol]
    
    var body: some View {
        
        HStack {
            ScrollView(.horizontal) {
                HStack {
                    Image(systemName: "slider.horizontal.3")
                        .filterItemStyle()
                    ForEach(items, id: \.title) { item in
                        HStack {
                            Image(systemName: item.iconName)
                                .padding(4)
                                .background(Color.black.opacity(0.1))
                                .cornerRadius(6)
                            Text(item.title)
                        }
                        .filterItemStyle()
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding()
    }
}


struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(items: [FilterItem(type: .headphones, iconName: "headphones",
                                      title: "Headset"),
                           FilterItem(type: .earphones, iconName: "earpods", title: "Earphones"),
                           FilterItem(type: .laptop, iconName: "laptopcomputer", title: "Laptop"),
                           FilterItem(type: .watches, iconName: "applewatch.watchface", title: "Watches"),
                           FilterItem(type: .iphones, iconName: "iphone.gen2", title: "iPhones")].sorted { $0.title < $1.title})
    }
}
