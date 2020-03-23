//
//  LandmarkList.swift
//  LandMarks
//
//  Created by AnatoleZhou on 2019/10/9.
//  Copyright © 2019 AnatoleZhou. All rights reserved.
//

import SwiftUI

struct LandmarkList<DetailView: View>: View {
    @EnvironmentObject private var userData: UserData
    
    let detailViewProducer: (Landmark) -> DetailView
    
//    @State var showFavoritesOnly = true
    var body: some View {
//        List(landmarkData, id: \.id){ landmark in
//            LandmarkRow(landmark: landmark)
//        }
            List {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Show Favorites Only")
                }
                ForEach(userData.landmarks) {
                    landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination: self.detailViewProducer(landmark).environmentObject(self.userData)){
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            .navigationBarTitle("Landmarks")
//            List(landmarkData){ landmark in
//                if !self.showFavoritesOnly || landmark.isFavorite {
//                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
//                                       LandmarkRow(landmark: landmark)
//
//                                   }
//                }
//
//            }

    }
}

#if os(watchOS)
typealias PreviewDetailView = WatchLandmarkDetail
#else
typealias PreviewDetailView = LandmarkDetail
#endif

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList(detailViewProducer: { PreviewDetailView(landmark: $0)}).environmentObject(UserData())

//        Group {
//            LandmarkList().previewDevice(PreviewDevice(rawValue: "iPhone XS"))
//            LandmarkList().previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
//
//        }
//        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) {
//            deviceName in
//            LandmarkList().previewDevice(PreviewDevice(rawValue: deviceName))
//            .previewDisplayName(deviceName)
//        }
    }
}
