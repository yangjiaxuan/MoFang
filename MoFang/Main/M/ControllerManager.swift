//
//  ControllerManager.swift
//  MoFang
//
//  Created by 杨森 on 16/9/20.
//  Copyright © 2016年 sitemap. All rights reserved.
//

import UIKit

enum ControllerType {
    case _1;
    case _2;
    case _3;
    case _4;
}

class ControllerManager{

    var item : Cell_BaseItem?;
    
    func changeVC(){
        moveToVCWithControllerType((item?.VCType)!)
        let b : UIButton? = UIButton();
        b?.addTarget(self, action: Selector("moveToVCWithControllerType:"), for: UIControlEvents.touchUpInside);
    }
    
    func moveToVCWithControllerType(_ type : ControllerType) {

        var toVC : UIViewController;
        switch type {
        case ControllerType._1:
            toVC = MainVC_1();
            fallthrough;
        case ControllerType._2:
            toVC = MainVC_1();
            fallthrough;
        case ControllerType._3:
            toVC = MainVC_1();
            fallthrough;
        case ControllerType._4:
            toVC = MainVC_1();
            
        }
        item?.fromVC?.navigationController?.pushViewController(toVC, animated: true);

    }
    
    
}
