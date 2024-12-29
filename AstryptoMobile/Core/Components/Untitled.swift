//
//  Untitled.swift
//  AstryptoMobile
//
//  Created by sstonn on 11/12/24.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    
    var body: some View{
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ? .theme.secondaryText : .theme.accent
                )
                .animation(.easeIn(duration: 0.5), value: searchText.isEmpty)
            
            TextField("Search by name or symbol...", text: $searchText)
                .disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding(10)
                        .foregroundColor(.theme.accent)
                        .opacity(searchText.isEmpty ? 0 : 1)
                        .animation(.easeIn(duration: 0.5), value: searchText.isEmpty).onTapGesture {
                            searchText = ""
                            UIApplication.shared.endEditing()
                        },
                    alignment: .trailing
                )
            
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.background)
                .shadow(
                    color: .theme.accent.opacity(0.15),
                    radius: 10,
                    x: 0,
                    y: 0
                )
        )
      
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
    }
}
