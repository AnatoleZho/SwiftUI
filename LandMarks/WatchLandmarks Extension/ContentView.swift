//
//  ContentView.swift
//  WatchLandmarks Extension
//
//  Created by AnatoleZhou on 2019/10/16.
//  Copyright © 2019 AnatoleZhou. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList { WatchLandmarkDetail(landmark: $0)}
        .environmentObject(UserData())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList { WatchLandmarkDetail(landmark: $0)}
        .environmentObject(UserData())
        
    }
}
