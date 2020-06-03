//
//  StoryboardView.swift
//  Lab12
//
//  Created by 黃俊維 on 2020/6/3.
//  Copyright © 2020 黃俊維. All rights reserved.
//

import SwiftUI

struct StoryboardView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = StoryboardController
    
    func makeUIViewController(context: Context) -> StoryboardController {
        UIStoryboard(name: "Storyboard", bundle: nil).instantiateViewController(identifier: "StoryboardController") as! StoryboardController
    }
    
    func updateUIViewController(_ uiViewController: StoryboardController, context: Context) {
        
    }
}

struct StoryboardView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
