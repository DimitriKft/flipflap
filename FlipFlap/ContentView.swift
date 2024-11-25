//
//  ContentView.swift
//  FlipFlap
//
//  Created by dimitri on 25/11/2024.
//

import SwiftUI


struct ContentView: View {
    @State private var isFlipped = false
    @State private var rotationAngle = 0.0
    @State var backDegree = 0.0
    var body: some View {
        VStack {
            ZStack {
                if isFlipped {
                    CardBackView(width: 200, height: 300, degree: $backDegree)
                } else {
                    CardFrontView()
                }
            }
            .rotation3DEffect(
                .degrees(rotationAngle),
                axis: (x: 0, y: 1, z: 0)
            )
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.6)) {
                    rotationAngle += 180
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    isFlipped.toggle()
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
