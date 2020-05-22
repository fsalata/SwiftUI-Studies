//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Fábio Salata on 22/05/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
	@State var showFavoritesOnly = false
	
    var body: some View {
		NavigationView {
			List {
				Toggle(isOn: $showFavoritesOnly) {
					Text("Favorites only")
						.padding(.horizontal, 10)
						.padding(.vertical)
				}
				
				ForEach(landmarkData) { landmark in
					if !self.showFavoritesOnly || landmark.isFavorite {
						NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
							LandmarkRow(landmark: landmark)
						}
					}
				}
			}
			.navigationBarTitle(Text("Landmarks"))
		}
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
		LandmarkList()
		
//		ForEach(["iPhone 11", "iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
//			LandmarkList()
//				.previewDevice(PreviewDevice(rawValue: deviceName))
//				.previewDisplayName(deviceName)
//		}
        
    }
}
