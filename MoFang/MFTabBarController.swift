//
//  MFTabBarController.swift
//  MoFang
//
//  Created by 杨森 on 16/9/19.
//  Copyright © 2016年 sitemap. All rights reserved.
//

import UIKit

class MFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = UIColor.orange;
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        self.navigationController?.navigationBar.isHidden = true;
    }

}
