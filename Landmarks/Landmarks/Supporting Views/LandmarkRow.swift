//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Fábio Salata on 22/05/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
	var landmark: Landmark
	
    var body: some View {
		HStack {
			landmark.image
				.resizable()
				.frame(width: 50, height: 50)
			
			Text(landmark.name)
			
			Spacer()
		}
		.padding(.horizontal, 10)
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			LandmarkRow(landmark: landmarkData[0])
			LandmarkRow(landmark: landmarkData[1])
			LandmarkRow(landmark: landmarkData[2])
			LandmarkRow(landmark: landmarkData[3])
		}
		.previewLayout(.fixed(width: 300, height: 70))
    }
}
