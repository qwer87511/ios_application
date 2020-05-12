//
//  VideoList.swift
//  lab08
//
//  Created by 黃俊維 on 2020/5/12.
//  Copyright © 2020 黃俊維. All rights reserved.
//

import SwiftUI

let videos = [
    Video(name: "v1", director: "d1"),
    Video(name: "v2", director: "d2"),
    Video(name: "v3", director: "d3"),
    Video(name: "v4", director: "d4"),
    Video(name: "v5", director: "d5"),
    Video(name: "v6", director: "d6"),
    Video(name: "v7", director: "d7"),
    Video(name: "v8", director: "d8"),
    Video(name: "v9", director: "d9"),
    Video(name: "v10", director: "d10")
]

struct VideoList: View {
    var body: some View {
        List(0 ..< videos.count) { (i) in
            NavigationLink(destination: VideoDetail(video: videos[i])) {
                VideoRow(video: videos[i])
            }
        }
    }
}

struct VideoList_Previews: PreviewProvider {
    static var previews: some View {
        VideoList()
    }
}

