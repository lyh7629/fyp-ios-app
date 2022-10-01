//
//  home.swift
//  fyp
//
//  Created by Yat Hin Leung on 11/9/2022.
//

import SwiftUI
import BottomSheet
import MapKit

struct SearchView: View {
    @State private var isPresented = true
    @State var bottomSheetPosition: BottomSheetPosition = .relative(0.4)
    @State private var orig = ""
    
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
        NavigationView {
            Map(coordinateRegion: $region)
                .ignoresSafeArea()
                .bottomSheet(bottomSheetPosition: $bottomSheetPosition,
                             switchablePositions: [
                                .relative(0.125),
                                .relative(0.4),
                                .relativeTop(1.0),
                             ],
                             headerContent: {
                    SearchBar()
                }) {
                    
                }
        }
    }
}

struct home_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
