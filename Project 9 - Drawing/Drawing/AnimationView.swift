//
//  AnimationView.swift
//  Drawing
//
//  Created by Salih Özdemir on 10.03.2023.
//

import SwiftUI

struct Checkerbord: Shape {
    var rows: Int
    var columns: Int
    
    var animatableData: AnimatablePair<Double, Double> {
        get { AnimatablePair(Double(rows), Double(columns)) }
        set {
            rows = Int(newValue.first)
            columns = Int(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let rowSize =  rect.height / Double(rows)
        let columnsSize = rect.width / Double(columns)
        
        for row in 0..<rows {
            for column in 0..<columns {
                if (row + column).isMultiple(of: 2) {
                    /// this square should be colored, add a rectangle here
                    let startX = columnsSize * Double(column)
                    let startY = rowSize * Double(row)
                    
                    let rect = CGRect(x: startX, y: startY, width: columnsSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }
        
        return path
    }
}

struct Trapezoid: Shape {
    var insetAmount: Double
    
    var animatableData: Double {
        get { insetAmount }
        set { insetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
}

struct AnimationView: View {
    @State private var insetAmount = 50.0
    
    @State private var rows = 4
    @State private var columns = 4
    @State private var switchFlag = false
    
    @State private var shouldAnimate = false
    
    var body: some View {
        VStack {
            Toggle("Should animate?", isOn: $shouldAnimate)
            
            Trapezoid(insetAmount: insetAmount)
                .frame(width: 200, height: 100)
                .onTapGesture {
                    if shouldAnimate {
                        withAnimation {
                            insetAmount = Double.random(in: 10...90)
                        }
                    } else {
                        insetAmount = Double.random(in: 10...90)
                    }
                }
            
            Divider()
                .padding(.vertical)
            
            Checkerbord(rows: rows, columns: columns)
                .onTapGesture {
                    if shouldAnimate {
                        withAnimation {
                            if !switchFlag {
                                rows = 8
                                columns = 16
                            } else {
                                rows = 4
                                columns = 4
                            }
                            
                            switchFlag.toggle()
                        }
                    } else {
                        if !switchFlag {
                            rows = 8
                            columns = 16
                        } else {
                            rows = 4
                            columns = 4
                        }
                        
                        switchFlag.toggle()
                    }
                }
        }
        .padding()
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
