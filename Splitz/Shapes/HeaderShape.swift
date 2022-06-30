//
//  HeaderShape.swift
//  Splitz
//
//  Created by Julian Schmid on 24.06.22.
//

import SwiftUI

struct ComicShape: Shape {
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        p.move(to: rect.origin)
        p.addLine(to: .init(x: rect.width, y: 0))
        p.addArc(center: .init(x: rect.width - radius, y: rect.height - 2 * radius), radius: radius, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: false)
        p.addLine(to: .init(x: radius, y: rect.height - radius))
        p.addArc(center: .init(x: radius, y: rect.height), radius: radius, startAngle: .degrees(270), endAngle: .degrees(180), clockwise: true)
        return p
    }
}

extension View {
    func headerShape(background: [Color], radius: CGFloat) -> some View {
        self
            .padding(.bottom, radius)
            .background(LinearGradient(colors: background, startPoint: .leading, endPoint: .topTrailing))
            .clipShape(ComicShape(radius: radius))
    }
}
