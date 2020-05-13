//
//  ContentView.swift
//  lab9
//
//  Created by Aaron Huang on 2020/5/12.
//  Copyright © 2020 Aaron Huang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var photos: [String] = ["Show Lo", "Butterfly"]
    @State private var cornerRadius: CGFloat = 200
    @State private var opacity: Double = 1.0
    @State private var blur: CGFloat = 0
    @State private var brightness: Double = 0.0
    @State private var contrast: Double = 1.0
    @State private var grayscale: Double = 0
    @State private var rotation: Double = 0
    @State private var shadow: CGFloat = 0
    @State private var selectIndex: Int = 0
    var body: some View {
        VStack {
            Text(photos[selectIndex])
                .bold()
                .font(.system(size: 30))
                .padding(.top, 40.0)
            Image(photos[selectIndex])
                .resizable()
                .scaledToFit()
                .clipped()
                .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                .frame(width: 300, height: 300)
                .opacity(opacity)
                .blur(radius: blur)
                .brightness(brightness)
                .contrast(contrast)
                .grayscale(grayscale)
                .rotationEffect(Angle(degrees: rotation))
                .shadow(radius: shadow)
                .cornerRadius(cornerRadius)
            Picker(selection: $selectIndex, label: Text("selector")) {
                ForEach(0 ..< photos.count) { (index) in
                    Text(self.photos[index])
                }
            }
                .clipped()
                .padding(.vertical)
                .labelsHidden()
                .frame(width: 200, height: 100)
            VStack {
                HStack {
                    Text("opacity")
                        .frame(width: 150)
                    Slider(value: $opacity, in: 0...1)
                    Spacer()
                }
                HStack {
                    Text("contrast")
                        .frame(width: 150)
                    Slider(value: $contrast, in: 0.1...3)
                    Spacer()
                }
                HStack {
                    Text("cornerRadius")
                        .frame(width: 150)
                    Slider(value: $cornerRadius, in: 0...200, step: 1)
                    Spacer()
                }
                HStack {
                    Text("blur")
                        .frame(width: 150)
                    Slider(value: $blur, in: 0...10)
                    Spacer()
                }
                HStack {
                    Text("brightness")
                        .frame(width: 150)
                    Slider(value: $brightness, in: 0...1)
                    Spacer()
                }
                HStack {
                    Text("grayscale")
                        .frame(width: 150)
                    Slider(value: $grayscale, in: 0...0.9)
                    Spacer()
                }
                HStack {
                    Text("rotation")
                        .frame(width: 150)
                    Slider(value: $rotation, in: 0...360, step: 1)
                    Spacer()
                }
                HStack {
                    Text("shadow")
                        .frame(width: 150)
                    Slider(value: $shadow, in: 0...50)
                    Spacer()
                }
            }
            Button(action: {
                self.contrast = Double.random(in: 0.1...3)
                self.opacity = Double.random(in: 0...1)
                self.cornerRadius = CGFloat.random(in: 0...200)
                self.blur = CGFloat.random(in: 0...10)
                self.brightness = Double.random(in: 0...0.5)
                self.grayscale = Double.random(in: 0...0.9)
                self.rotation = Double.random(in: 0...360)
                self.shadow = CGFloat.random(in: 0...50)
                self.selectIndex = Int.random(in: 0...1)
            }) {
                Text("random")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .frame(width: 250, height: 50)
            }
            .background(Color.blue)
            .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
            
       }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
