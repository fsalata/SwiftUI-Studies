//
//  Cardify.swift
//  Memorize
//
//  Created by Fábio Salata on 10/06/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier {
	var isFaceUp: Bool
	
	func body(content: Content) -> some View {
		ZStack {
			if isFaceUp {
				RoundedRectangle(cornerRadius: 10).fill(Color.white)
				RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
				Pie(startAngle: Angle.degrees(0 - 90), endAngle: Angle.degrees(110 - 90), clockwise: true)
					.padding(5)
					.opacity(0.4)
				content
			} else {
				RoundedRectangle(cornerRadius: 10).fill()
			}
		}
	}
}

extension View {
	func cardify(isFaceUp: Bool) -> some View {
		self.modifier(Cardify(isFaceUp: isFaceUp))
	}
}
