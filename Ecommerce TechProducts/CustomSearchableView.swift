//
//  CustomSearchableView.swift
//  Ecommerce TechProducts
//
//  Created by Diego Monteagudo Diaz on 29/03/23.
//

import SwiftUI

struct CustomSearchableView: View {
    @Binding var text: String
    @State var showCancelButton = false
    @FocusState var isFocused: Bool
    var body: some View {
        HStack {
            TextField("\(Image(systemName: "magnifyingglass")) search for products", text: $text)
                .focused($isFocused)
                .onChange(of: isFocused, perform: { onEditingMode in
                    if onEditingMode {
                        withAnimation {
                            showCancelButton.toggle()
                        }
                    } else {
                        withAnimation {
                            showCancelButton.toggle()
                        }
                    }
                })
                .frame(height: 30)
                .padding()
                .background(.gray.opacity(0.1))
                .cornerRadius(12)
            if showCancelButton {
                Button {
                    text = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                } label: {
                    Text("Cancel")
                        .foregroundColor(.blue)
                }
            }
        }
        .navigationBarHidden(isFocused)
        .padding()
    }
}

struct CustomSearchableView_Previews: PreviewProvider {
    @State static var text = ""
    
    static var previews: some View {
        CustomSearchableView(text: $text)
    }
}
