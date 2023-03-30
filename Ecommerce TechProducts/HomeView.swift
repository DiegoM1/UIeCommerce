//
//  HomeView.swift
//  Ecommerce TechProducts
//
//  Created by Diego Monteagudo Diaz on 30/03/23.
//

import SwiftUI

struct HomeView: View {
    
    @State var searcheableText = ""
    @State var carItemsCounter = 0
    @State var filterSelected: [FilterType] = [FilterType]()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    FilterView(filterSelected: $filterSelected, items: MockData.filterItems)
                    
                    ForEach(MockData.sections) { section in
                        HomeSectionsView(title: section.title, moreButtonTitle: section.moreButtonTitle, items: section.items)
                    }
                }
                .searchable(text: $searcheableText, prompt: "Search for products")
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(filterSelected: [.iphones])
    }
}
