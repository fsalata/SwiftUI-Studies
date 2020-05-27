//
//  ContentView.swift
//  Memorize
//
//  Created by Fábio Salata on 27/05/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	var viewModel: EmojiMemoryGame
	
    var body: some View {
		HStack {
			ForEach(viewModel.cards) { card in
				CardView(card: card).onTapGesture {
					self.viewModel.choose(card)
				}
				.font(self.viewModel.cards.count > 4 ? .headline : .largeTitle)
				.aspectRatio(2/3, contentMode: .fit)
			}
		}
    }
}

struct CardView: View {
	var card: MemoryGame<String>.Card
	
	var body: some View {
		ZStack {
			if card.isFaceUp {
				RoundedRectangle(cornerRadius: 10).fill(Color.white)
				RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
				Text(card.content)
			} else {
				RoundedRectangle(cornerRadius: 10).fill(Color.yellow)
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
