//
//  ContentView.swift
//  AvocadoToast
//
//  Created by Fábio Salata on 20/05/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@State var liked: Bool = false
	
    var body: some View {
		ZStack {
			Image("avocado_toast")
				.resizable()
				.edgesIgnoringSafeArea(.all)
			VStack {
				HStack {
					Text("Hardcore Avo Toast")
						.font(.largeTitle)
						.foregroundColor(.white)
						.shadow(color: Color.black, radius: 3, x: 3, y: 3)
						.padding(.horizontal)
					Spacer()
					Button(action: {
						self.liked.toggle()
					}) {
						Image(self.liked ? "heart-selected" : "heart")
							.resizable()
							.frame(width: 40, height: 40)
							.foregroundColor(self.liked ? .red : .white)
					}
				}
				.padding()
				Spacer()
				Text("Energize with the healthy and hearty breakfast")
					.foregroundColor(.white)
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
