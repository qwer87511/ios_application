//
//  VideoRow.swift
//  lab08
//
//  Created by 黃俊維 on 2020/5/12.
//  Copyright © 2020 黃俊維. All rights reserved.
//

import SwiftUI

struct VideoRow: View {
    
    let video: Video
    
    var body: some View {
        HStack {
            Image(video.name)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipped()
            VStack(alignment: .leading) {
                Text(video.name)
                Text(video.director)
            }
            Spacer()
        }
    }
}

struct VideoRow_Previews: PreviewProvider {
    static var previews: some View {
        VideoRow(video: videos[0])
    }
}
