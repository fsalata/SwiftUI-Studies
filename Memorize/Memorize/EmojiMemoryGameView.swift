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
			self.body(for: geometry.size)
		}
	}
	
	@ViewBuilder
	private func body(for size: CGSize) -> some View {
		if card.isFaceUp || !card.isMatched {
			ZStack {
				Pie(startAngle: Angle.degrees(0 - 90), endAngle: Angle.degrees(110 - 90), clockwise: true)
					.padding(5)
					.opacity(0.4)
				Text(self.card.content)
					.font(Font.system(size: min(size.width, size.height) * 0.65))
			}
			.cardify(isFaceUp: card.isFaceUp)
			.padding(10)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		let emojiGame = EmojiMemoryGame()
		emojiGame.choose(emojiGame.cards[0])
        return EmojiMemoryGameView(viewModel: emojiGame)
    }
}
