//
//  HomeSectionsView.swift
//  Ecommerce TechProducts
//
//  Created by Diego Monteagudo Diaz on 30/03/23.
//

import SwiftUI
struct Section: Identifiable {
    var id = UUID()
    var title: String
    var moreButtonTitle: String
    var items: [Item]
}
struct Item: Identifiable {
    var id = UUID()
    var name: String
    var price: Double
    var img: String
    var isFavorite = false
    
    var priceText: String {
        String(format: "$%.2f", self.price)
    }
}

struct HomeSectionsView: View {
    
    var title: String
    var moreButtonTitle: String
    // TODO: Add action to more button -> var moreButtonAction: () -> Void
    
    var items: [Item]
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .fontWeight(.semibold)
                Spacer()
                Button {
                    print("more Button pressed")
                } label: {
                    Text(moreButtonTitle)
                        .foregroundColor(.blue)
                        .fontWeight(.bold)
                }

            }
            let columns = [GridItem(.flexible()), GridItem(.flexible())]
            let widthGrid = UIScreen.main.bounds.width / 2 - 28
            LazyVGrid(columns: columns, spacing: 14) {
                ForEach(items) { item in
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.gray.opacity(0.1))
                        .frame(width: widthGrid,height: 140)
                        .overlay {
                            VStack(spacing: 0) {
                                HStack{
                                    Spacer()
                                    Image(systemName: "suit.heart.fill")
                                        .foregroundColor(Bool.random() ?  .blue : .gray.opacity(0.4))
                                }
                                Image(systemName: item.img)
                                    .resizable()
                                    .frame(width: widthGrid / 2,height: 50)
                                    .padding(8)
                                Text(item.name)
                                    .font(.system(size: 12))
                                    .fontWeight(.bold)
                                    .padding(2)
                                Text(item.priceText)
                                    .font(.system(size: 11))
                                    .foregroundColor(.blue)
                                    .fontWeight(.semibold)
                            }
                            .padding(.horizontal, 8)
                        }
                }
            }
        }
        .padding()
    }
}

struct HomeSectionsView_Previews: PreviewProvider {
    static var array = [Item(name: "Apple AirPods", price: 99.99, img: "laptopcomputer.and.iphone"), Item(name: "Apple AirPods", price: 99.99, img: "laptopcomputer.and.iphone"), Item(name: "Apple AirPods", price: 99.99, img: "laptopcomputer.and.iphone"), Item(name: "Apple AirPods", price: 99.99, img: "laptopcomputer.and.iphone"), Item(name: "Apple AirPods", price: 99.99, img: "laptopcomputer.and.iphone")]
    static var previews: some View {
        HomeSectionsView(title: "New arrivals", moreButtonTitle: "See all", items: array)
    }
}
