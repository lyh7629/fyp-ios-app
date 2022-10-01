//
//  BusDetail.swift
//  fyp
//
//  Created by Yat Hin Leung on 19/9/2022.
//

import SwiftUI
import MapKit

struct RouteDetailView: View {
    var route: BusRoute
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 22.33787,
            longitude: 114.18131
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.005,
            longitudeDelta: 0.005
        )
    )
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region)
            List(BusStop.data) { busStop in
                BusStopView(busStop: busStop)
            }
            .listStyle(.plain)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text("\(route.company) \(route.routeName)")
                        .bold()
                    Text("to \(route.dest)")
                        .font(.caption)
                        .foregroundColor(Color.gray)
                }
            }
        }
    }
}

struct BusDetail_Previews: PreviewProvider {
    static var previews: some View {
        RouteDetailView(route: BusRoute(company: "KMB", routeName: "1", origin: "Chuk Yuen", dest: "Star Ferry"))
    }
}

struct BusStop: Identifiable {
    var id: Int64
    var busStopName: String
    var fare: Double
    var latitude: Double
    var longitude: Double
    var order: Int
}

struct BusStopView: View, Identifiable {
    var id: String = UUID().uuidString
    @State private var showDetail: Bool = false
    var busStop: BusStop
    
    var body: some View {
        content
            .animation(Animation.easeInOut(duration: 1.0), value: 5.0)
    }
    
    var header: some View {
        VStack (alignment: .leading) {
            Text("\(busStop.order). \(busStop.busStopName)")
                .bold()
                .font(.title3)
            Text(String(format: "Fare: %.1f", busStop.fare))
        }
        .onTapGesture {
            showDetail.toggle()
        }
    }
    
    var content: some View {
        VStack (alignment: .leading, spacing: 5.0){
            header
            if showDetail {
                VStack (alignment: .leading, spacing: 1.0) {
                    Group {
                        Text("2 min (11:20:05)")
                        Text("12 min (11:30:05)")
                        Text("22 min (11:40:05)")
                    }
                    .foregroundColor(.blue)
                }
                
            }
        }
    }
}

extension BusStop {
    static let data: [BusStop] = [
        BusStop(id: 111111, busStopName: "Bus Stop 1", fare: 12.8, latitude: 12.0, longitude: 12.0, order: 1),
        BusStop(id: 111112, busStopName: "Bus Stop 2", fare: 12.8, latitude: 12.0, longitude: 12.0, order: 2),
    ]
}
