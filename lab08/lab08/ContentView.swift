//
//  ContentView.swift
//  lab08
//
//  Created by 黃俊維 on 2020/5/9.
//  Copyright © 2020 黃俊維. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
           VideoList()
           .navigationBarTitle("Vieos")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
