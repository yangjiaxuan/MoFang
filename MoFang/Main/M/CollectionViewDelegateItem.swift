//
//  CollectionViewDelegateItem.swift
//  MoFang
//
//  Created by 杨森 on 16/9/20.
//  Copyright © 2016年 sitemap. All rights reserved.
//

import UIKit

enum CellType : Int{
    
    case wheelView = 0;
    case header;
    case cell_1;
    case cell_2;
    case cell_3;
    case cell_4;
}

enum ActionType {
    case more;
    case collection;
    case imageView;
}

let SCREEN_W = UIScreen.main.bounds.size.width;
let SCREEN_H = UIScreen.main.bounds.size.height;

class Cell_BaseItem : Section_item {
    
    var fromVC : UIViewController?;
    var VCType : ControllerType?;
    var cellType : CellType?{

        didSet{

            switch cellType! {
            case CellType.wheelView:
                size = CGSize(width: SCREEN_W - sectionInsets.left - sectionInsets.right, height: SCREEN_W * 0.5);
                break
            case CellType.header:
                size = CGSize(width: SCREEN_W - sectionInsets.left - sectionInsets.right, height: 40);
                break
            case CellType.cell_1:
                size = CGSize(width: SCREEN_W - sectionInsets.left - sectionInsets.right, height: SCREEN_W * 0.5);
                break
            case CellType.cell_2:
                size = self.setCellSizeWithCellNumPerLine(2, originSize: CGSize(width: 640, height: 720));
                break
            case CellType.cell_3:
                size = self.setCellSizeWithCellNumPerLine(3, originSize: CGSize(width: 640, height: 720));
                break
            case CellType.cell_4:
                size = self.setCellSizeWithCellNumPerLine(4, originSize: CGSize(width: 640, height: 720));
                break
            default:
                break;
            }
        }
    }
    
    func setCellSizeWithCellNumPerLine(_ cellNumber : Int, originSize : CGSize) -> CGSize {
        
        let cellW = (SCREEN_W - self.sectionMinInterSapce * CGFloat(cellNumber - 1) - self.sectionInsets.left - self.sectionInsets.right)/CGFloat(cellNumber);
        let cellH = cellW * originSize.height/originSize.width;
        return CGSize(width: cellW, height: cellH);
    }
    var size : CGSize?;
    
}

class Cell_Item_WheelView : Cell_BaseItem {
    var image : [String]?;
    var title : String?;
}

class Cell_HeaderItem : Cell_BaseItem {
    var title : String?;

    
}

class Cell_Item_1 : Cell_BaseItem {
    var image : String?;
    var title : String?;
}

class Cell_Item_2 : Cell_BaseItem {
    var image : String?;
    var title : String?;
}

class Cell_Item_3 : Cell_BaseItem {
    var image : String?;
    var title : String?;
}

class Cell_Item_4 : Cell_BaseItem {
    var image : String?;
    var title : String?;
}

class Section_item : NSObject {
    
    var sectionInsets : UIEdgeInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6);
    var sectionMinSpace : CGFloat = 6;
    var sectionMinInterSapce : CGFloat = 6;
    
    var cellData : [Cell_BaseItem]?;
    
}

class CollectionViewDelegateItem: NSObject {

    var dataArray : [Section_item]?;
    
    
    
}
