//
//  ContentView.swift
//  Ecommerce TechProducts
//
//  Created by Diego Monteagudo Diaz on 27/03/23.
//

import SwiftUI

protocol FilterItemProtocol {
    var title: String { get }
    var iconName: String { get }
    var type: FilterType { get }
}

enum FilterType: CaseIterable {
    case earphones, headphones, laptop, watches, iphones
}

struct FilterItem: Identifiable, FilterItemProtocol {
    var id = UUID()
    var type: FilterType
    var iconName: String
    var title: String
}

struct ContentView: View {
    var filterItems: [FilterItem] = [FilterItem(type: .headphones, iconName: "headphones",
                                                title: "Headset"),
                                     FilterItem(type: .earphones, iconName: "earpods", title: "Earphones"),
                                     FilterItem(type: .laptop, iconName: "laptopcomputer", title: "Laptop"),
                                     FilterItem(type: .watches, iconName: "applewatch.watchface", title: "Watches"),
                                     FilterItem(type: .iphones, iconName: "iphone.gen2", title: "iPhones")].sorted { $0.title < $1.title}
    
    @State var searcheableText = ""
    @State var carItemsCounter = 0
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    CustomSearchableView(text: $searcheableText)
                    FilterView(items: filterItems)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack(spacing: 4) {
                        Text("Hi, Maria")
                            .fontWeight(.semibold)
                        Image(systemName: "hand.wave.fill")
                            .foregroundColor(.yellow)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button {
                            withAnimation {
                                carItemsCounter += 1
                            }
                            
                        } label: {
                            Image(systemName: "cart.fill")
                                .overlay(alignment: .topTrailing) {
                                    Text(String(carItemsCounter))
                                        .padding(4)
                                        .font(.system(size: 8))
                                        .background(.red)
                                        .foregroundColor(.white)
                                        .clipShape(Circle())
                                        .padding(.top, -5)
                                }
                            
                        }
                        
                        Button {
                            print("Align pressed")
                        } label: {
                            Image(systemName: "text.alignright")
                            
                        }
                        
                    }
                    .foregroundColor(.black)
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
