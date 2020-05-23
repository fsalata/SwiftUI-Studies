//
//  Badge.swift
//  Landmarks
//
//  Created by Fábio Salata on 23/05/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import SwiftUI

struct Badge: View {
	static let rotationCount = 8
	
	var badgeSymbols: some View {
		ForEach(0..<Badge.rotationCount) { i in
			RotatedBadgeSymbol(angle: .init(degrees: Double(i) / Double(Badge.rotationCount)) * 360)
				.opacity(0.5)
		}
	}
	
    var body: some View {
		ZStack {
			BadgeBackground()
			
			GeometryReader { geometry in
				self.badgeSymbols
					.scaleEffect(1 / 4, anchor: .top)
					.position(x: geometry.size.width / 2.0, y: (3 / 4) * geometry.size.height)
			}
		}
		.scaledToFit()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}