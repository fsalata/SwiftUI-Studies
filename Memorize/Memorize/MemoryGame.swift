//
//  MemoryGame.swift
//  Memorize
//
//  Created by Fábio Salata on 27/05/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
	var cards: Array<Card>
	
	var indexOfFaceUpCard: Int? {
		get {
			let facedUpCards = cards.indices.filter { cards[$0].isFaceUp }
			return facedUpCards.count == 1 ? facedUpCards.first : nil
		}
		
		set {
			for index in cards.indices {
				cards[index].isFaceUp = index == newValue
			}
		}
	}
	
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
		if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
			if let potentialMatchIndex = indexOfFaceUpCard {
				if cards[chosenIndex].content == cards[potentialMatchIndex].content {
					cards[chosenIndex].isMatched = true
					cards[potentialMatchIndex].isMatched = true
				}
				self.cards[chosenIndex].isFaceUp = true
			} else {
				indexOfFaceUpCard = chosenIndex
			}
		}
	}
	
	struct Card: Identifiable {
		var id = UUID()
		var isFaceUp: Bool = false
		var isMatched: Bool = false
		var content: CardContent
	}
}
