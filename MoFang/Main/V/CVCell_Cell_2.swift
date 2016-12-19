//
//  CVCell_Cell_2.swift
//  MoFang
//
//  Created by yangsen on 16/9/21.
//  Copyright © 2016年 sitemap. All rights reserved.
//

import UIKit

class CVCell_Cell_2: UICollectionViewCell {
        
    @IBOutlet weak var backImageView: UIImageView!
    var cellData : Cell_Item_2?{
        
        didSet{
            if (cellData != nil) {
                self.backImageView.image = UIImage(named: (cellData?.image)!);
            }
        }
    };
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
