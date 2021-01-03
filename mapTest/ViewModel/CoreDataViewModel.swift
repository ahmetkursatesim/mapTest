//
//  CoreDataViewModel.swift
//  mapTest
//
//  Created by Kursat on 3.01.2021.
//

import SwiftUI

import SwiftUI

import CoreData
class CoreDataViewModel : ObservableObject {
    func fetchMapInfo(viewContext:NSManagedObjectContext,entityname:String)->[MapEntity]{
        let mapInfoList=[MapEntity]()
        do {
            let fetchrequest=NSFetchRequest<NSFetchRequestResult>(entityName: entityname)
            let items=try viewContext.fetch(fetchrequest) as! [NSManagedObject]
            let mapInfos=items as! [MapEntity]
            if(mapInfos.count>0){
                return mapInfos
            }
            return mapInfoList
            
        }catch{
            return mapInfoList
        }
    }
    
    
    func addMapInfo(viewContext:NSManagedObjectContext,entityMap:MapPlace){
        let newItem = MapEntity(context:viewContext)
        newItem.latitude=entityMap.latitude
        newItem.longitude=entityMap.longitude
        newItem.title=entityMap.title
        newItem.subtitle=entityMap.subtitle
        newItem.id=entityMap.id
        do {
            
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
    }
    
    
}
