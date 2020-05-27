//
//  MemoryGame.swift
//  Memorize
//
//  Created by Fábio Salata on 27/05/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
	var cards: Array<Card>
	
	init(numberOfPairsOfCards: Int, makeContent: (Int) -> CardContent) {
		cards = Array<Card>()
		for index in 0..<numberOfPairsOfCards {
			let content = makeContent(index)
			let pair = Array(repeating: Card(content: content), count: 2)
			cards.append(contentsOf: pair)
		}
	}
	
	func choose(card: Card) {
		print("card chosen: \(card)")
	}
	
	struct Card: Identifiable {
		var id = UUID()
		var isFaceUp: Bool = true
		var isMatched: Bool = false
		var content: CardContent
	}
}
