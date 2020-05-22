//
//  ContentView.swift
//  Landmarks
//
//  Created by Fábio Salata on 22/05/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		VStack {
			MapView()
				.frame(height: 300)
				.edgesIgnoringSafeArea(.top)
			
			CircleImage()
				.offset(y: -170)
				.padding(.bottom, -170)
			
			VStack(alignment: .leading) {
				Text("Turtle Rock")
					.font(.title)
					.foregroundColor(.green)
				
				HStack {
					Text("Joshua Tree National Park")
						.font(.subheadline)
					
					Spacer()
					
					Text("California")
						.font(.subheadline)
				}
			}
			.padding()
			
			Spacer()
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
