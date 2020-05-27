//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Fábio Salata on 27/05/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import Foundation

final class EmojiMemoryGame {
	private var model: MemoryGame<String> = EmojiMemoryGame.createEmojiGame()
	
	static func createEmojiGame() -> MemoryGame<String> {
		let emojis = ["👻", "🎃", "🕷", "🕸", "👹"]
		return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...5)) { index in
			return emojis[index]
		}
	}
	
	var cards: Array<MemoryGame<String>.Card> {
		model.cards.shuffled()
	}
	
	func choose(_ card: MemoryGame<String>.Card) {
		model.choose(card: card)
	}
	
}
