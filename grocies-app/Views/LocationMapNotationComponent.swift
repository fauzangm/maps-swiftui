//
//  LocationMapNotationComponent.swift
//  grocies-app
//
//  Created by Fauzan Ghozi Mubarak on 02/11/23.
//

import SwiftUI

struct LocationMapNotationComponent: View {
    
    let accentColor = Color("AccentColor")
    var body: some View {
        VStack(spacing: 0){
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30,height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(accentColor)
                .cornerRadius(36)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30,height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(accentColor)
                .cornerRadius(36)
        }
    }
}

struct LocationMapNotationComponent_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapNotationComponent()
    }
}
