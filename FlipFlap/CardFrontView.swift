//
//  CardFrontView.swift
//  FlipFlap
//
//  Created by dimitri on 25/11/2024.
//

import SwiftUI

struct CardFrontView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 200, height: 300)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 2) 
                )

            VStack {
                HStack {
                    Image(systemName: "2.circle.fill")
                        .font(.system(size: 30))
                        .foregroundStyle(.red)
                    Spacer()
                }
                Spacer()
                Image(systemName: "heart.fill")
                    .font(.system(size: 50))
                    .foregroundStyle(.red)
                
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: "2.circle.fill")
                        .font(.system(size: 30))
                        .foregroundStyle(.red)
                }
            }
            .padding(10)
            .frame(width: 200, height: 300)
        }
    }
}

#Preview {
    CardFrontView()
}
