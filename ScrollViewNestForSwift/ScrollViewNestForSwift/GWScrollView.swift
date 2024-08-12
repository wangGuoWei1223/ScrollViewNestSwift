//
//  GWScrollView.swift
//  SwiftProject
//
//  Created by Gavin on 2024/8/11.
//  Copyright © 2024 Gavin. All rights reserved.
//

import UIKit

class GWScrollView: UIScrollView {
    
    var canScroll: Bool = false;
    
}

extension GWScrollView: UIGestureRecognizerDelegate {

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {

        return true;
    }
}
