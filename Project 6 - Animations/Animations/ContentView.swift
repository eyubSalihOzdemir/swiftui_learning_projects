//
//  ContentView.swift
//  Animations
//
//  Created by Salih Özdemir on 3.03.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    @State private var secondAnimationAmount = 1.0
    @State private var rotationAnimationAmount = 0.0
    
    @State private var dragAmount = CGSize.zero
    
    let letters = Array("Hello, SwiftUI")
    @State private var textAnimEnabled = false
    @State private var textDragAmount = CGSize.zero
    
    var body: some View {
        VStack(spacing: 60) {
            VStack(spacing: 50) {
                Stepper("Scale Amount", value: $secondAnimationAmount.animation(), in: 1...10)
                    .padding()
                
                Button("Tap Me") {
                    secondAnimationAmount += 1
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .scaleEffect(secondAnimationAmount)
            }
            
            Divider()
                      
            HStack {
                Button("Rotate Me") {
                    withAnimation(.interpolatingSpring(stiffness: 5, damping: 0.5)) {
                        rotationAnimationAmount += 360
                    }
                }
                .padding(50)
                .background(.green)
                .foregroundColor(.white)
                .clipShape(Circle())
                .rotation3DEffect(.degrees(rotationAnimationAmount), axis: (x: 0, y:1, z:0))
                
                LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottom)
                    .frame(width: 150, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .offset(dragAmount)
                    .gesture(
                        DragGesture()
                            .onChanged { dragAmount = $0.translation }
                            .onEnded { _ in
                                //withAnimation {
                                    dragAmount = .zero
                                //}
                            }
                    )
                    .animation(.spring(), value: dragAmount)
            }
            
            Divider()
            
            HStack(spacing: 0) {
                ForEach(0..<letters.count) { num in
                    Text(String(letters[num]))
                        .font(.title)
                        .foregroundColor(.white)
                        .background(textAnimEnabled ? .blue : .red)
                        .offset(textDragAmount)
                        .animation(
                            .default.delay(Double(num) / 20),
                            value: textDragAmount
                        )
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { textDragAmount = $0.translation }
                    .onEnded { _ in
                        textDragAmount = .zero
                        textAnimEnabled.toggle()
                    }
            )
            
            Divider()
            
            Button("") { }
            .padding(40)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeInOut(duration: 1)
                            .repeatForever(autoreverses: false),
                        value: animationAmount
                    )
            )
            .onAppear {
                animationAmount = 2
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
