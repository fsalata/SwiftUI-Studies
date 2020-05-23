//
//  ContentView.swift
//  Landmarks
//
//  Created by Fábio Salata on 22/05/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
	var landmark: Landmark
	
	@EnvironmentObject var userData: UserData
	
	var landmarkIndex: Int {
		userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
	}
	
    var body: some View {
		VStack {
			MapView(coordinate: landmark.locationCoordinate)
				.edgesIgnoringSafeArea(.top)
				.frame(height: 300)
			
			CircleImage(image: landmark.image)
				.offset(y: -130)
				.padding(.bottom, -130)
			
			VStack(alignment: .leading) {
				HStack {
					Text(landmark.name)
						.font(.title)
						.foregroundColor(.green)
					
					Button(action: {
						self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
					}) {
						Image(systemName: self.userData.landmarks[self.landmarkIndex].isFavorite ? "star.fill" : "star")
							.foregroundColor(self.userData.landmarks[self.landmarkIndex].isFavorite ? .yellow : .gray)
					}
				}
				
				HStack {
					Text(landmark.park)
						.font(.subheadline)
					
					Spacer()
					
					Text(landmark.state)
						.font(.subheadline)
				}
			}
			.padding()
			
			Spacer()
		}
		.navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		LandmarkDetail(landmark: landmarkData[0])
    }
}
