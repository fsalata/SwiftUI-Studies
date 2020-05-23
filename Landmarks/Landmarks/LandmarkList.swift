//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Fábio Salata on 22/05/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
	@EnvironmentObject var userData: UserData
	
    var body: some View {
		NavigationView {
			List {
				Toggle(isOn: $userData.showFavoritesOnly) {
					Text("Favorites only")
						.padding(.horizontal, 10)
						.padding(.vertical)
				}
				
				ForEach(userData.landmarks) { landmark in
					if !self.userData.showFavoritesOnly || landmark.isFavorite {
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
			.environmentObject(UserData())
		
//		ForEach(["iPhone 11", "iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
//			LandmarkList()
//				.previewDevice(PreviewDevice(rawValue: deviceName))
//				.previewDisplayName(deviceName)
//		}
        
    }
}
