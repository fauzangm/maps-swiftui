//
//  LocationPreviewView.swift
//  grocies-app
//
//  Created by Fauzan Ghozi Mubarak on 02/11/23.
//

import SwiftUI

struct LocationPreviewView: View {
    let location : Location
    var body: some View {
        HStack(alignment : .bottom, spacing: 0){
            VStack(alignment: .leading, spacing: 16){
                imageSection
                tittleSectoin
            }
            
            Spacer()
            
            VStack(spacing : 8){
                learnMoreButton
                nextButton
            
            }
        }
        .frame(maxWidth:.infinity)
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y:65)
        )
        .cornerRadius(10)
        
        

    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        LocationPreviewView(location: LocationsDataService.locations.first!)
    }
}


extension LocationPreviewView {
    private var imageSection : some View{
        ZStack{
            if let imageName = location.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100,height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    private var tittleSectoin : some View{
        VStack(alignment: .leading,spacing: 4){
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
        }
    }
    
    private var learnMoreButton : some View{
        Button{
            
        }label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton : some View{
        Button{
            
        }label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.bordered)
    }
}
