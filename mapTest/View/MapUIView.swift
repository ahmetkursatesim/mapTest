//
//  MapUIView.swift
//  mapTest
//
//  Created by Kursat on 2.01.2021.
//

import SwiftUI
import MapKit
import CoreData

struct MapUIView: View {
    let persistenceController = PersistenceController.shared
    @State private var locations = [MKPointAnnotation]()
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails = false
    @ObservedObject var datamanager = CoreDataViewModel()
    let fetchrequest=NSFetchRequest<NSFetchRequestResult>(entityName: "MapEntity")
    var body: some View {
        
        
        ZStack {
            MapView(centerCoordinate: $centerCoordinate, annotations: locations, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails)
                .edgesIgnoringSafeArea(.all)
            Circle()
                .fill(Color.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        let newLocation = MKPointAnnotation()
                        newLocation.title = "Choosed Location"
                        newLocation.subtitle="ahmet"
                        let Item=MapPlace(title: "Choosed Location", subtitle: "Choosed Location", latitude:self.centerCoordinate.latitude,longitude:self.centerCoordinate.longitude)
                        datamanager.addMapInfo(viewContext: PersistenceController.shared.container.viewContext, entityMap: Item)
                        newLocation.coordinate = self.centerCoordinate
                       
                        self.locations.append(newLocation)
                    }) {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(Color.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
            }
            
        }.alert(isPresented: $showingPlaceDetails) {
            Alert(title: Text(selectedPlace?.title ?? "Unknown"), message: Text(selectedPlace?.subtitle ?? "Missing place information."), primaryButton: .default(Text("OK")), secondaryButton: .default(Text("Edit")) {
                // edit this place
            })
        }
        .onAppear(){
            
            let items=datamanager.fetchMapInfo(viewContext:PersistenceController.shared.container.viewContext , entityname:"MapEntity")
            
            items.forEach { (MapEntity) in
                let newLocation = MKPointAnnotation()
                newLocation.title = MapEntity.title
                newLocation.subtitle = MapEntity.subtitle
                newLocation.coordinate=CLLocationCoordinate2D(latitude:MapEntity.latitude , longitude: MapEntity.longitude)
                self.locations.append(newLocation)
            }
            
   
        }
        
        
    }
}

struct MapUIView_Previews: PreviewProvider {
    static var previews: some View {
        MapUIView()
    }
}
