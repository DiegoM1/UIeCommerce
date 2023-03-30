//
//  FilterView.swift
//  Ecommerce TechProducts
//
//  Created by Diego Monteagudo Diaz on 27/03/23.
//

import SwiftUI


struct FilterView: View {
    @Binding var filterSelected: [FilterType]
    var items: [FilterItemProtocol]
    
    var body: some View {
        HStack {
            ScrollView(.horizontal) {
                HStack {
                    Image(systemName: "slider.horizontal.3")
                        .filterItemStyle()
                    ForEach(items, id: \.title) { item in
                        Button {
                            if filterSelected.contains { $0 == item.type} {
                                filterSelected.removeAll { $0 == item.type}
                            } else {
                                filterSelected.append(item.type)
                            }
                        } label: {
                            HStack {
                                Image(systemName: item.iconName)
                                    .padding(4)
                                    .background(Color.black.opacity(0.1))
                                    .cornerRadius(6)
                                Text(item.title)
                            }
                            .foregroundColor(.black)
                            .filterItemStyle()
                        }
                        .background(filterSelected.contains { $0 == item.type} ? .blue.opacity(0.5) : .clear)
                        .cornerRadius(6)
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.horizontal, 16)
    }
}


struct FilterView_Previews: PreviewProvider {
    
    @State static var filterSelected: [FilterType] = [.iphones]
    static var previews: some View {
        FilterView(filterSelected: $filterSelected, items: [FilterItem(type: .headphones, iconName: "headphones",
                                      title: "Headset"),
                           FilterItem(type: .earphones, iconName: "earpods", title: "Earphones"),
                           FilterItem(type: .laptop, iconName: "laptopcomputer", title: "Laptop"),
                           FilterItem(type: .watches, iconName: "applewatch.watchface", title: "Watches"),
                           FilterItem(type: .iphones, iconName: "iphone.gen2", title: "iPhones")].sorted { $0.title < $1.title})
    }
}
