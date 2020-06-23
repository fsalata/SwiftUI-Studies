//
//  ContentView.swift
//  CardAnimation
//
//  Created by Fábio Salata on 22/06/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var cardMove = false
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Details")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.bottom, 10)
                    .opacity(cardMove ? 1 : 0)
                    .animation(.spring())
                
                Text("Current Balance")
                    .foregroundColor(.gray)
                    .font(.system(size: 19, weight: .medium, design: .rounded))
                
                Text("$11,500")
                    .foregroundColor(.white)
                    .font(.system(size: 35, weight: .bold, design: .rounded))
            }
            .offset(y: cardMove ? -300 : -250)
            .animation(.spring())
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(0..<5) { _ in
                        GeometryReader { geometry in
                            Card(cardMove: self.$cardMove)
                                .rotation3DEffect(.init(degrees: Double(geometry.frame(in: .global).minX - 20) / 30),
                                                        axis: (x: 10, y: -20, z: 0))
                                .onTapGesture {
                                    self.cardMove.toggle()
                            }
                        }
                        .frame(width: 375, height: 200)
                    }
                }
                .frame(height: 350)
                .padding(.leading, 20)
            }
            .padding(.top, cardMove ? -250 : 50)
            .animation(.spring())
            
            BottomCard()
                .offset(y: cardMove ? 250 : 1000)
                .animation(.spring())
        }
        .animation(.spring())
    }
}

struct Card: View {
    @Binding var cardMove: Bool
    
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
        .rotationEffect(.init(degrees: cardMove ? 0 : 90))
        .animation(.spring())
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
