//
//  CVCell_WheelView.swift
//  MoFang
//
//  Created by yangsen on 16/9/21.
//  Copyright © 2016年 sitemap. All rights reserved.
//

import UIKit

class CVCell_WheelView: UICollectionViewCell {
    
    var wheelView : WheelView? = nil{
        didSet{
            wheelView?._selectedCellWithIndex = {[weak self] (index : Int)->() in
                self?._selectedCellWithImageViewIndex(self!,ActionType.imageView, index);
            }
        }
    }
    
    var _selectedCellWithImageViewIndex = {(cell : UICollectionViewCell, actionType : ActionType, actionTag : Int)->() in }{
        didSet{
            wheelView?._selectedCellWithIndex = {[weak self] (index : Int)->() in
                self?._selectedCellWithImageViewIndex(self!,ActionType.imageView, index);
            }
        }
    }
    
    var cellData : Cell_Item_WheelView?{
    
        didSet{
            imageData = cellData?.image;
        }
    
    }
    
    fileprivate var _imageData : [String]?;
    var imageData : [String]?{
    
        get{
            return _imageData;
        }
        set{
            _imageData = newValue;
            wheelView = WheelView(frame: self.bounds, images: newValue!);
            self.addSubview(wheelView!);
        }
    
    }
    
    
}
