//
//  ViewController.swift
//  ScrollViewNestForSwift
//
//  Created by Gavin on 2024/8/12.
//  Copyright © 2024 Gavin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var syncScrollContext:SyncScrollContext
    
    convenience init() {
        self.init(nibName:nil, bundle:nil);
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        syncScrollContext = SyncScrollContext(maxOuterOffsetY: 380.0, maxInnerOffsetY: 0.0)
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder: NSCoder) {
        syncScrollContext = SyncScrollContext(maxOuterOffsetY: 380.0, maxInnerOffsetY: 0.0)
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        outerScrollView.frame = CGRect(x: 10.0, y: 90.0, width: 350.0, height: 550.0);
        outerScrollView.contentSize = CGSize(width: 350.0, height: 1800.0);
        view.addSubview(outerScrollView);
        
        innerScrollView.frame = CGRect(x: 10.0, y: 400.0, width: 300.0, height: 300.0);
        innerScrollView.contentSize = CGSize(width: 300.0, height: 800.0);
        outerScrollView.addSubview(innerScrollView);
        
        let v1 = UIView(frame: CGRect(x: 90.0, y: 0.0, width: 90.0, height: 90.0))
        v1.backgroundColor = .yellow
        innerScrollView.addSubview(v1)
        
        let v2 = UIView(frame: CGRect(x: 90.0, y: 90.0, width: 90.0, height: 90.0));
        v2.backgroundColor = .red;
        innerScrollView.addSubview(v2);
        
    }
    
    lazy var outerScrollView: GWScrollView = {
        let scrollView = GWScrollView();
        scrollView.delegate = self as UIScrollViewDelegate
        scrollView.backgroundColor = .blue
        scrollView.canScroll = true;
        return scrollView
    }();
    
    lazy var innerScrollView: GWScrollView = {
        let scrollView = GWScrollView();
        scrollView.delegate = self as UIScrollViewDelegate
        scrollView.backgroundColor = .gray
        scrollView.canScroll = false
        return scrollView
    }();

}

extension ViewController : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView == outerScrollView {
            let contentOffset = outerScrollView.contentOffset;
            if !outerScrollView.canScroll {
                outerScrollView.contentOffset = CGPoint(x: 0.0, y: syncScrollContext.maxOuterOffsetY)
            }
            
            if outerScrollView.contentOffset.y >= syncScrollContext.maxOuterOffsetY {
                outerScrollView.canScroll = false;
                innerScrollView.canScroll = true;
                
                /*
                外层滚动到目标位置后 把滚动距离 传给内存 scrollView
                当外层 scrollerView 滚动到最大值后 内部scrollerView 接着滚动剩余部分
                */
                let offsetY = contentOffset.y - syncScrollContext.maxOuterOffsetY;
                var innerOffset = innerScrollView.contentOffset;
                innerOffset.y += offsetY;
                innerScrollView.contentOffset = innerOffset
                
            }else {
                outerScrollView.canScroll = true;
                innerScrollView.canScroll = false;
            }
            
        } else if scrollView == innerScrollView {
            
            if !innerScrollView.canScroll {
                innerScrollView.contentOffset = CGPoint(x: 0.0, y: syncScrollContext.maxInnerOffsetY);
            }
            
            if innerScrollView.contentOffset.y <= syncScrollContext.maxInnerOffsetY {
                innerScrollView.canScroll = false;
                outerScrollView.canScroll = true;
            }else {
                innerScrollView.canScroll = true;
                outerScrollView.canScroll = false;
            }
        }
        
    }
}

