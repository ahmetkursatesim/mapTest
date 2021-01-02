//
//  MapUIView.swift
//  mapTest
//
//  Created by Kursat on 2.01.2021.
//

import SwiftUI
import MapKit


struct MapUIView: View {
    
    let places = [
           MapPlace(name: "British Museum", latitude: 51.519581, longitude: -0.127002),
           MapPlace(name: "Tower of London", latitude: 51.508052, longitude: -0.076035),
           MapPlace(name: "Big Ben", latitude: 51.500710, longitude: -0.124617)
       ]
    
    @State var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.514134, longitude: -0.104236),
            span: MKCoordinateSpan(latitudeDelta: 0.075, longitudeDelta: 0.075))
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: places) { item in
            MapAnnotation(coordinate: item.coordinate, anchorPoint: CGPoint(x: 0.5, y: 0.5)) {
                Circle()
                    .strokeBorder(Color.red, lineWidth: 10)
                    .frame(width: 44, height: 44)
            }
              }
              .ignoresSafeArea(.all)
              
    }
}

struct MapUIView_Previews: PreviewProvider {
    static var previews: some View {
        MapUIView()
    }
}
