//
//  MapPlace.swift
//  mapTest
//
//  Created by Kursat on 2.01.2021.
//

import MapKit
import SwiftUI

struct MapPlace:Identifiable {
    let id=UUID()
    let name:String
    let latitude:Double
    let longitude:Double
    var coordinate: CLLocationCoordinate2D {
           CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
       }
}
