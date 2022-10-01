//
//  Search.swift
//  fyp
//
//  Created by Yat Hin Leung on 12/9/2022.
//

import SwiftUI

struct SearchBar: View {
    @State var origin:String = ""
    @State var destination:String = ""
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Origin", text: $origin)
            }
            .foregroundColor(Color(UIColor.secondaryLabel))
            .padding(.horizontal, 10.0)
            .padding(.vertical, 10.0)
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke()
                .foregroundColor(.gray))

            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Destination", text: $destination)
            }
            .padding(.horizontal, 10.0)
            .padding(.vertical, 10.0)
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke()
                .foregroundColor(.gray))
        }
        .padding()
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
