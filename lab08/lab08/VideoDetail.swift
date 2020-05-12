//
//  VideoDetail.swift
//  lab08
//
//  Created by 黃俊維 on 2020/5/12.
//  Copyright © 2020 黃俊維. All rights reserved.
//

import SwiftUI

struct VideoDetail: View {
    
    let video: Video
    
    var body: some View {
        VStack {
            Image(video.name)
                .resizable()
                .scaledToFill()
                .frame(height: 300)
                .clipped()
            Text("director: \(video.director)")
        }
    }
}

struct VideoDetail_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetail(video: videos[0])
    }
}
