//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Fábio Salata on 27/05/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
	@ObservedObject var viewModel: EmojiMemoryGame
	
    var body: some View {
		Grid(viewModel.cards) { card in
			CardView(card: card).onTapGesture {
				self.viewModel.choose(card)
			}
		}
		.padding()
		.foregroundColor(.orange)
    }
}

struct CardView: View {
	var card: MemoryGame<String>.Card
	
	var body: some View {
		GeometryReader{ geometry in
			ZStack {
				if self.card.isFaceUp {
					RoundedRectangle(cornerRadius: 10).fill(Color.white)
					RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
					Text(self.card.content)
				} else {
					RoundedRectangle(cornerRadius: 10).fill()
				}
			}
			.padding(10)
			.font(Font.system(size: min(geometry.size.width, geometry.size.height) * 0.75))
		}
		
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
