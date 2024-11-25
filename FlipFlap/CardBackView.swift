//
//  CardBackView.swift
//  FlipFlap
//
//  Created by dimitri on 25/11/2024.
//

import SwiftUI

struct CardBackView: View {
    let width: CGFloat
    let height: CGFloat
    @Binding var degree: Double

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.red.opacity(0.6))
                .frame(width: width, height: height)
                .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 0)
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 3)
                .frame(width: width, height: height)
            
            HexShape()
                .frame(width: 100, height: 100)
                .overlay(
                    HexShape()
                        .stroke(Color.white, lineWidth: 6)
                )
        }
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

#Preview {
    CardBackView(width: 200, height: 300, degree: .constant(0.0))
}

struct HexShape: Shape {
    let degreesToRadians = CGFloat.pi / 180
    
    func path(in rect: CGRect) -> Path {
        let angle: CGFloat = CGFloat(360/6)
        let startAngle: CGFloat = -(angle/2)
        let cornerRadius: CGFloat = rect.maxX / 5.0
        let centerX = rect.midX
        let centerY = rect.midY
        let radius = rect.width/2

        let pt0 = CGPoint(x: centerX + radius * cos((startAngle + angle * 0) * degreesToRadians),y: centerY )
    
        var path = Path()
        path.move(to: pt0)
        for i in 1...6 {
            let pt1 = CGPoint(x: centerX + radius * cos((startAngle + angle * CGFloat(i)) * degreesToRadians),
                              y: centerY - radius * sin((startAngle + angle * CGFloat(i)) * degreesToRadians))
            let pt2 = CGPoint(x: centerX + radius * cos((startAngle + angle * CGFloat(i+1)) * degreesToRadians),
                              y: centerY - radius * sin((startAngle + angle * CGFloat(i+1)) * degreesToRadians))
            path.addArc(tangent1End: pt1, tangent2End: pt2, radius: cornerRadius)
        }
        path.closeSubpath()
        return path
    }
}
