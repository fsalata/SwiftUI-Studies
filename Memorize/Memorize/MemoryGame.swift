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
			let pair = [Card(content: content), Card(content: content)]
			cards.append(contentsOf: pair)
		}
		cards.shuffle()
	}
	
	mutating func choose(card: Card) {
		let index = cards.firstIndex { $0.id == card.id }!
		cards[index].isFaceUp = !cards[index].isFaceUp
	}
	
	struct Card: Identifiable {
		var id = UUID()
		var isFaceUp: Bool = false
		var isMatched: Bool = false
		var content: CardContent
	}
}
