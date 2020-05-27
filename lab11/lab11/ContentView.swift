//
//  ContentView.swift
//  lab11
//
//  Created by 鄭宇翔 on 2020/5/26.
//  Copyright © 2020 105590028. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingSheet = false
    
    var body: some View {
        VStack{
            TextView()
            Button(action: {
                self.showingSheet = true
            }) {
                Text("Share")
            }
            .sheet(isPresented: $showingSheet,
                   content: {
                    ActivityView(activityItems: ["As"] as [Any], applicationActivities: nil) })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
