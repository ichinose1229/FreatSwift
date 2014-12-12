//
//  ViewController.swift
//  FreatSwift
//
//  Created by Ichinose Yuto on 2014/12/12.
//  Copyright (c) 2014年 Ichinose Yuto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.setPanel()
    }
    
    func setPanel() {
        let btnW = self.view.frame.width/4
        let btnH = self.view.frame.height/6
        for i in 0...23 {
            let btnX = CGFloat(i%4) * btnW + CGFloat(i%4)
            let btnY = CGFloat(i/4) * btnH + CGFloat(i/4)
            let btn:UIButton = UIButton(frame: CGRectMake(btnX, btnY, btnW, btnH))
            btn.backgroundColor = UIColor.blackColor()
            btn.tag = i + 1
            btn.addTarget(self, action:"pushPanel:" , forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addSubview(btn);
        }
    }
    
    func pushPanel(sender:AnyObject?) {
        let panel:UIButton = sender as UIButton
        self.switchPanelColor(panel)
        
        var leftPanelTag = panel.tag - 1
        var rightPanelTag = panel.tag + 1
        let topPanelTag = panel.tag - 4
        let bottomPanelTag = panel.tag + 4
        
        if (panel.tag - 1)%4 == 0 {
            leftPanelTag = -1
        }else if (panel.tag - 1)%4 == 3 {
            rightPanelTag = -1
        }
        
        for view in self.view.subviews {
            if view is UIButton &&
                (view.tag == leftPanelTag ||
                view.tag == rightPanelTag ||
                view.tag == topPanelTag ||
                view.tag == bottomPanelTag) {
                self.switchPanelColor(view as UIButton)
            }
        }
    }
    
    func switchPanelColor(btn:UIButton) {
        if btn.backgroundColor == UIColor.blackColor() {
            btn.backgroundColor = UIColor.yellowColor()
        } else {
            btn.backgroundColor = UIColor.blackColor()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

