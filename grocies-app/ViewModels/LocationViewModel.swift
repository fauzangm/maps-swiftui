//
//  LocationViewModel.swift
//  grocies-app
//
//  Created by Fauzan Ghozi Mubarak on 02/11/23.
//

import Foundation
import MapKit
import SwiftUI

class LocationViewModel: ObservableObject {
    
    // All loaded locations
    @Published var location: [Location]
    
    // Current location on map
    @Published var mapLocation: Location {
        didSet{
            updateMapRegion(location: mapLocation)
        }
    }
    // Current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // Show list of locations
    @Published var showLocationsList: Bool = false
    
    //show location detial via sheet
    @Published var sheetLocation: Location? = nil
    
    init(){
        let location =  LocationsDataService.locations
        self.location = location
        self.mapLocation = location.first!
        self.updateMapRegion(location: location.first!)
    }
    
    
    private func updateMapRegion(location: Location){
        withAnimation(.easeInOut){
            mapRegion = MKCoordinateRegion(
                center: location.coordinates, span: mapSpan)
        }
    }
    
    func toogleLocationsList(){
        withAnimation(.easeInOut) {
            showLocationsList = !showLocationsList
        }
    }
    
    func showNextLocation(location : Location){
        withAnimation(.easeInOut){
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed(){
        // Get the current index
        guard let currentIndex = location.firstIndex(where: {$0 == mapLocation}) else{
            print("Could not find current index in location")
            return
        }
        
        // Check if the currentIndex is valid
        let nextIndex = currentIndex + 1
        guard location.indices.contains(nextIndex) else{
            // Next index is NOT valid
            // Restart from 0
            guard let firstLocation = location.first else {return}
            showNextLocation(location: firstLocation)
            return
        }
        
        // Next index is Valid
        let nextLocation = location[nextIndex]
        showNextLocation(location: nextLocation)
            
       
    }
}
