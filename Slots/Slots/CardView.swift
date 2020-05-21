//
//  CardView.swift
//  Slots
//
//  Created by Fábio Salata on 21/05/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import SwiftUI

struct CardView: View {
	var symbol: String
	var number: Int
	var won: Bool
	
    var body: some View {
        Image(systemName: symbol)
		.resizable()
		.aspectRatio(1, contentMode: .fit)
		.foregroundColor(number > 1 ? Color.red : Color.black)
		.padding()
		.background(won ? Color.yellow : Color.white.opacity(0.5))
		.cornerRadius(20)
		.shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 0)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
		CardView(symbol: "suit.spade.fill", number: 0, won: false).previewLayout(.sizeThatFits)
    }
}
