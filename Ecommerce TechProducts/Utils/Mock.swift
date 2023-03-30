//
//  Mock.swift
//  Ecommerce TechProducts
//
//  Created by Diego Monteagudo Diaz on 30/03/23.
//

import Foundation

struct MockData {
    static var filterItems: [FilterItem] = [FilterItem(type: .headphones, iconName: "headphones",
                                                       title: "Headset"),
                                            FilterItem(type: .earphones, iconName: "earpods", title: "Earphones"),
                                            FilterItem(type: .laptop, iconName: "laptopcomputer", title: "Laptop"),
                                            FilterItem(type: .watches, iconName: "applewatch.watchface", title: "Watches"),
                                            FilterItem(type: .iphones, iconName: "iphone.gen2", title: "iPhones")].sorted { $0.title < $1.title}
    
    static var sections: [Section] = [Section(title: "New arrivals",
                                              moreButtonTitle: "See all",
                                              items: [Item(name: "Apple AirPods",
                                                           price: 99.99,
                                                           img: "laptopcomputer.and.iphone"),
                                                      Item(name: "Apple AirPods",
                                                           price: 99.99,
                                                           img: "laptopcomputer.and.iphone")]),
                                      Section(title: "Most Popular",
                                              moreButtonTitle: "Custom",
                                              items: [Item(name: "Apple AirPods",
                                                           price: 99.99,
                                                           img: "laptopcomputer.and.iphone"),
                                                      Item(name: "Apple AirPods",
                                                           price: 99.99,
                                                           img: "laptopcomputer.and.iphone"),
                                                      Item(name: "Apple AirPods",
                                                           price: 99.99,
                                                           img: "laptopcomputer.and.iphone"),
                                                      Item(name: "Apple AirPods",
                                                           price: 99.99,
                                                           img: "laptopcomputer.and.iphone"),
                                                      Item(name: "Apple AirPods",
                                                           price: 99.99,
                                                           img: "laptopcomputer.and.iphone")])]
}

// Models && Protocols

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
