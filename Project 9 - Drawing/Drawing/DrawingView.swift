//
//  ContentView.swift
//  Drawing
//
//  Created by Salih Özdemir on 10.03.2023.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct Arc: InsettableShape {
    let startAngle: Angle
    let endAngle: Angle
    let clockwise: Bool
    var insetAmount = 0.0
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStartAngle = startAngle - rotationAdjustment
        let modifiedEndAngle = endAngle - rotationAdjustment
        
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: (rect.width / 2) - insetAmount, startAngle: modifiedStartAngle, endAngle: modifiedEndAngle, clockwise: !clockwise)
        
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct DrawingView: View {
    var body: some View {
        //NavigationView {
            VStack {
                HStack(spacing: 10) {
                    Triangle()
                        .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                        .frame(width: 100, height: 100)
                    
                    Arc(startAngle: .degrees(0), endAngle: .degrees(90), clockwise: true)
                        .stroke(.blue, lineWidth: 10)
                        .frame(width: 100, height: 100)
                }
                .padding()
                
                Circle()
                    .strokeBorder(.blue, lineWidth: 20)
                
                GeometryReader { geo in
                    Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
                        .strokeBorder(.green, lineWidth: 30)
                        .frame(width: geo.size.width, height: geo.size.width)
                }
            }
            //.navigationTitle("Drawing Paths & Shapes")
            //.navigationBarTitleDisplayMode(.inline)
            .padding()
        //}
    }
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView()
    }
}
