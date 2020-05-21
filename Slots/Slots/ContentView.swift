//
//  ContentView.swift
//  Slots
//
//  Created by Fábio Salata on 21/05/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	private var symbols = ["suit.spade.fill", "suit.club.fill", "suit.heart.fill", "suit.diamond.fill"]
	private let betAmount = 5
	
	@State private var numbers = [0, 1, 2]
	@State private var credits = 100
	@State private var won = false
	
	var body: some View {
		ZStack {
			Rectangle()
				.foregroundColor(Color(red: 0/255, green: 180/255, blue: 0/255))
				.edgesIgnoringSafeArea(.all)
			
			Rectangle()
				.foregroundColor(.green)
				.rotationEffect(Angle(degrees: 45))
				.edgesIgnoringSafeArea(.all)
			
			VStack {
				Spacer()
				
				// Title
				HStack {
					Image(systemName: "star.fill")
						.foregroundColor(.yellow)
					
					Text("SwiftUI Slots")
						.bold()
					
					Image(systemName: "star.fill")
					.foregroundColor(.yellow)
				}
				.font(.largeTitle)
				
				Spacer()
				
				// Credits
				Text("Credits: " + String(credits))
					.padding(10)
					.background(Color.white.opacity(0.5))
					.cornerRadius(20)
				
				Spacer()
				
				// Slots
				HStack {
					Spacer()
					
					Image(systemName: symbols[numbers[0]])
						.resizable()
						.aspectRatio(1, contentMode: .fit)
						.foregroundColor(numbers[0] > 1 ? Color.red : Color.black)
						.padding()
						.background(won ? Color.yellow : Color.white.opacity(0.5))
						.cornerRadius(20)
					
					Image(systemName: symbols[numbers[1]])
						.resizable()
						.aspectRatio(1, contentMode: .fit)
						.foregroundColor(numbers[1] > 1 ? Color.red : Color.black)
						.padding()
						.background(won ? Color.yellow :Color.white.opacity(0.5))
						.cornerRadius(20)
					
					Image(systemName: symbols[numbers[2]])
						.resizable()
						.aspectRatio(1, contentMode: .fit)
						.foregroundColor(numbers[2] > 1 ? Color.red : Color.black)
						.padding()
						.background(won ? Color.yellow :Color.white.opacity(0.5))
						.cornerRadius(20)
					
					Spacer()
				}
				
				Spacer()
				
				// Button
				Button(action: {
					self.won = false
					
					self.numbers[0] = Int.random(in: 0...self.symbols.count - 1)
					self.numbers[1] = Int.random(in: 0...self.symbols.count - 1)
					self.numbers[2] = Int.random(in: 0...self.symbols.count - 1)
					
					if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] {
						self.credits += self.betAmount * 10
						self.won = true
					}
					else {
						self.credits -= self.betAmount
					}
				}) {
					Text("Spin")
						.foregroundColor(.white)
						.padding(.all, 10)
						.padding(.horizontal, 30)
						.background(Color.pink)
						.cornerRadius(20)
				}
				
				Spacer()
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
