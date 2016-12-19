//
//  CVCell_Cell_1.swift
//  MoFang
//
//  Created by 杨森 on 16/9/20.
//  Copyright © 2016年 sitemap. All rights reserved.
//

import UIKit

class CVCell_Cell_1: UICollectionViewCell {

    lazy var backImageView: UIImageView = {
        
        let backIgView : UIImageView = UIImageView(frame: self.bounds);
        self.addSubview(backIgView);
        return backIgView;
        
    }()
    var cellData : Cell_Item_1?{
    
        didSet{
            if (cellData != nil) {
                self.backImageView.image = UIImage(named: (cellData?.image)!);
            }
        }
    };

}
