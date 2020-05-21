//
//  ContentView.swift
//  ColorPicker
//
//  Created by Fábio Salata on 21/05/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@State private var red: Double = 0
	@State private var green: Double = 0
	@State private var blue: Double = 0
	
    var body: some View {
		VStack {
			Rectangle()
				.frame(width: 100, height: 100)
				.foregroundColor(Color(red: red / 255, green: green / 255, blue: blue / 255))
				.border(Color.black, width: 1)
			
			Spacer()
				.frame(height: 80)
			
			SliderView(value: $red, title: "Red")
			SliderView(value: $green, title: "Green")
			SliderView(value: $blue, title: "Blue")
		}
		.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
