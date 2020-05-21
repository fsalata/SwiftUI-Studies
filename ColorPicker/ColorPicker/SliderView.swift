//
//  SliderView.swift
//  ColorPicker
//
//  Created by Fábio Salata on 21/05/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import SwiftUI

struct SliderView: View {
	@Binding var value: Double
	var title: String
	
    var body: some View {
		VStack{
			Slider(value: $value, in: 0...255, step: 1)
			Text("\(title): \(Int(value))")
		}
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
		SliderView(value: Binding.constant(0), title: "Red")
			.previewLayout(.sizeThatFits)
			.padding()
    }
}
