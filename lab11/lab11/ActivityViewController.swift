//
//  ActivityViewController.swift
//  lab11
//
//  Created by 鄭宇翔 on 2020/5/26.
//  Copyright © 2020 105590028. All rights reserved.
//

import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    
    let activityItems: [Any]
    let applicationActivities: [UIActivity]?
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityView>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityView>) {
    }
    
    typealias UIViewControllerType = UIActivityViewController
    

}
