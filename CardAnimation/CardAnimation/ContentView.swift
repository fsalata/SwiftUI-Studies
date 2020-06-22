//
//  ContentView.swift
//  CardAnimation
//
//  Created by Fábio Salata on 22/06/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 1)).edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Currant Balance")
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<5) { _ in
                        Card()
                        .padding(.horizontal, 4)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

struct Card: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.993796289, green: 0.5024768114, blue: 0.9325050712, alpha: 1))]), startPoint: .bottomLeading, endPoint: .topTrailing)
            
            HStack {
                VStack(alignment: .leading) {
                    cardNumbers(lastFour: 1234)
                    
                    Spacer()
                    
                    HStack {
                        Text("$1,459")
                        
                        Spacer()
                        
                        circles()
                    }
                }
                
                Spacer()
            }
            .padding(.all, 25)
            
        }
        .frame(width: 325, height: 200)
        .cornerRadius(25)
        .foregroundColor(.white)
    }
    
    func cardNumbers(lastFour: Int) -> some View {
        HStack {
            ForEach(0..<12) { i in
                Image(systemName: "circle.fill")
                    .padding(.trailing, (i + 1) % 4 == 0 ? 6 : 0)
                    .font(.system(size: 6))
            }
            
            Text(String(lastFour))
        }
    }
    
    func circles() -> some View {
        ZStack {
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(.white).opacity(0.5)
            
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(.white).opacity(0.5)
                .padding(.leading, 25)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
