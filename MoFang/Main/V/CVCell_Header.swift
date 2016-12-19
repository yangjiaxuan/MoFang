//
//  CVCell_Header.swift
//  MoFang
//
//  Created by 杨森 on 16/9/20.
//  Copyright © 2016年 sitemap. All rights reserved.
//

import UIKit

class CVCell_Header: UICollectionViewCell {

    var data : Cell_HeaderItem?{

        didSet{
            titleLabel.text = data?.title;
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var btnActionHander : (_ cell : UICollectionViewCell, _ actionType : ActionType)->() = {(cell : UICollectionViewCell, actionType : ActionType)->() in };

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    @IBAction func moreBtnClick(_ sender: UIButton) {
        btnActionHander(self, ActionType.more);
    }
    
}
