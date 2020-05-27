//
//  UITextView.swift
//  lab11
//
//  Created by 鄭宇翔 on 2020/5/26.
//  Copyright © 2020 105590028. All rights reserved.
//

import SwiftUI

struct TextView: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<TextView>) -> UITextView {
        let view = UITextView()
        view.isScrollEnabled = true
        view.isEditable = true
        view.isUserInteractionEnabled = true
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        return view
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<TextView>) {
        
    }
    
    typealias UIViewType = UITextView
    
}
