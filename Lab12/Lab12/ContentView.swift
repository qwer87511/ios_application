//
//  ContentView.swift
//  Lab12
//
//  Created by 黃俊維 on 2020/6/3.
//  Copyright © 2020 黃俊維. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("swiftui").padding()
                NavigationLink(destination: StoryboardView()){
                    Text("to stroyboard")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
