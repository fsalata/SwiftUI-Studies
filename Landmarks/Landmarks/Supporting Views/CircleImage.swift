//
//  CircleImage.swift
//  Landmarks
//
//  Created by Fábio Salata on 22/05/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
	var image: Image
	
	var body: some View {
		image
			.clipShape(Circle())
			.overlay(
				Circle().stroke(Color.white, lineWidth: 4))
			.shadow(radius: 10)
	}
}

struct CircleImage_Previews: PreviewProvider {
	static var previews: some View {
		CircleImage(image: Image("turtlerock"))
	}
}
