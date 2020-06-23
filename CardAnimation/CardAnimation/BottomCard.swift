//
//  BottomCard.swift
//  CardAnimation
//
//  Created by Fábio Salata on 23/06/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import SwiftUI

struct BottomCard: View {
    private let cardContent = BottomCardContent.getAll()
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 30)
            
            ForEach(cardContent) { content in
                HStack {
                    Image(systemName: content.icon)
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .background(Color.white.opacity(0.4))
                        .clipShape(Circle())

                    VStack {
                        Text(content.name)
                            .font(.system(size: 17, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        
                        Text(content.date)
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Text(content.value)
                        .font(.system(size: 17, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                }
                .padding(.all, 20)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 500)
        .background(Color(#colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)))
        .cornerRadius(30)
    }
}

struct BottomCardContent: Identifiable {
    var id = UUID()
    var icon: String
    var name: String
    var date: String
    var value: String
    
    static func getAll() -> [BottomCardContent] {
        return Array(repeating: BottomCardContent(icon: "star", name: "HBO", date: "Today", value: "$9.99"), count: 5)
    }
}

struct BottomCard_Previews: PreviewProvider {
    static var previews: some View {
        BottomCard().previewLayout(.sizeThatFits)
    }
}
