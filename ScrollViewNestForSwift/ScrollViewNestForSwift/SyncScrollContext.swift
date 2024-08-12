//
//  SyncScrollContext.swift
//  SwiftProject
//
//  Created by Gavin on 2024/8/12.
//  Copyright © 2024 Gavin. All rights reserved.
//

import UIKit

class SyncScrollContext {
    
    var maxOuterOffsetY: CGFloat
    var maxInnerOffsetY: CGFloat
    
    init(maxOuterOffsetY:CGFloat, maxInnerOffsetY:CGFloat) {
        self.maxOuterOffsetY = maxOuterOffsetY;
        self.maxInnerOffsetY = maxInnerOffsetY;
    }
    
}
