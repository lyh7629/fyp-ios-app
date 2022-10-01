//
//  BusView.swift
//  fyp
//
//  Created by Yat Hin Leung on 16/9/2022.
//

import SwiftUI

struct BusView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List (BusRoute.data.filter({ route in
                route.routeName.lowercased().starts(with: searchText.lowercased())
            })){ route in
                NavigationLink(destination: RouteDetailView(route: route)) {
                    HStack(spacing: 10.0) {
                        VStack(spacing: 3.0) {
                            route.getCompanyImage()
                            Text(route.company)
                                .font(.caption)
                                .bold()
                        }
                        .fixedSize(horizontal: true, vertical: false)
                        .frame(width: 30.0)
                        
                        Text(route.routeName)
                            .bold()
                            .font(.title3)
                            .fixedSize(horizontal: true, vertical: false)
                            .frame(width: 50.0)
                    }
                    Spacer(minLength: 20.0)
                    VStack (alignment: .leading) {
                        Text(route.dest)
                            .lineLimit(1)
                        Text("from \(route.origin)")
                        
                            .foregroundColor(.gray)
                            .lineLimit(1)
                    }
                }
                .frame(height: 50.0)
                //                .padding(.vertical, 1)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Bus Route Search")
                        .bold()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(PlainListStyle())
            //            .listStyle(InsetGroupedListStyle())
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .searchable(text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "Search a route"
        )
        .keyboardType(.numberPad)
    }
}

struct BusView_Previews: PreviewProvider {
    static var previews: some View {
        BusView()
    }
}

struct BusRoute : Identifiable {
    var id =  UUID()
    var company : String
    var routeName : String
    var origin : String
    var dest : String
}

extension BusRoute {
    static let data = [
        BusRoute(company: "KMB", routeName: "1", origin: "Chuk Yuen", dest: "Star Ferry"),
        BusRoute(company: "KMB", routeName: "1", origin: "Star Ferry", dest: "Chuk Yuen"),
        BusRoute(company: "NWFB", routeName: "8P", origin: "Siu Sai Wan (Island Resort)", dest: "Exhibition Centre Station"),
        BusRoute(company: "NWFB", routeName: "8P", origin: "Exhibition Centre Station", dest: "Siu Sai Wan (Island Resort)"),
        BusRoute(company: "CTB", routeName: "969", origin: "Causeway Bay (Moreton Terrace)", dest: "Tin Shui Wai Town Centre"),
        BusRoute(company: "CTB", routeName: "969", origin: "Tin Shui Wai Town Centre", dest: "Causeway Bay (Moreton Terrace)"),
        BusRoute(company: "CTB", routeName: "969B", origin: "Tin Shui Wai Town Centre", dest: "Wan Chai"),
        BusRoute(company: "CTB", routeName: "969B", origin: "Wan Chai", dest: "Tin Shui Wai Town Centre"),
        BusRoute(company: "LWB", routeName: "A37", origin: "Long Ping Station", dest: "Airport (Ground Transportation Centre)"),
        BusRoute(company: "LWB", routeName: "A37", origin: "Airport", dest: "Long Ping Station"),
    ]
    
    func getCompanyImage() -> some View {
        var color : Color
        switch(company) {
        case "CTB":
            color = Color.yellow
            break
        case "NWFB":
            color = Color.orange
            break
        case "KMB":
            color = Color.red
            break
        case "LWB":
            color = Color.brown
            break
        default:
            color = Color.gray
            break
        }
        
        return Image(systemName: "bus.doubledecker.fill")
            .resizable()
            .frame(width: 30.0, height: 37.0)
            .foregroundColor(color)
    }
}
