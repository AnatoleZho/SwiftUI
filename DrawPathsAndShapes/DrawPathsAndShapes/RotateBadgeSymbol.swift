//
//  RotateBadgeSymbol.swift
//  DrawPathsAndShapes
//
//  Created by AnatoleZhou on 2019/10/11.
//  Copyright © 2019 AnatoleZhou. All rights reserved.
//

import SwiftUI

struct RotateBadgeSymbol: View {
    let angle: Angle
    
   
    
    
    var body: some View {
        BadgeSymbol()
        .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotateBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotateBadgeSymbol(angle: .init(degrees: 5))
    }
}
