//
//  CollectionViewDataSource.swift
//  MoFang
//
//  Created by 杨森 on 16/9/20.
//  Copyright © 2016年 sitemap. All rights reserved.
//

import UIKit
typealias BtnActionHander = (_ indexPath : IndexPath,_ actionType : ActionType,_ actionTag : Int)->()
class CollectionViewDataSource: NSObject,UICollectionViewDataSource {

    let dataArray : [Section_item]?;
    var btnActionHander : BtnActionHander;
    
    
    init(dataArray : [Section_item], btnActionHander :@escaping BtnActionHander) {
        self.dataArray = dataArray;
        self.btnActionHander = btnActionHander;
        super.init();
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellItem : Cell_BaseItem = (dataArray![(indexPath as NSIndexPath).section] as Section_item).cellData![(indexPath as NSIndexPath).row];
        
        let cell : UICollectionViewCell;
        switch  cellItem.cellType!{
        case CellType.wheelView:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell_WheelView", for: indexPath);
            (cell as? CVCell_WheelView)?.cellData = (cellItem as? Cell_Item_WheelView);
            (cell as? CVCell_WheelView)?._selectedCellWithImageViewIndex = {[weak self] (cell : UICollectionViewCell, actionType : ActionType, actionTag : Int)->() in
                self?.btnActionHander(collectionView.indexPath(for: cell)!, ActionType.imageView, actionTag);
            }
            break;
        case CellType.header:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell_Header", for: indexPath);
            (cell as? CVCell_Header)?.data = (cellItem as? Cell_HeaderItem);
            (cell as? CVCell_Header)?.btnActionHander = {[weak self] (cell : UICollectionViewCell, actionType : ActionType)->() in
                
                self?.btnActionHander(collectionView.indexPath(for: cell)!, ActionType.more, 0);
            }
            break;
        case CellType.cell_1:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell_Cell_1", for: indexPath);
            (cell as? CVCell_Cell_1)?.cellData = (cellItem as? Cell_Item_1);
            break;
        case CellType.cell_2:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell_Cell_2", for: indexPath);
            (cell as? CVCell_Cell_2)?.cellData = (cellItem as? Cell_Item_2);
            break;
        case CellType.cell_3:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell_Cell_2", for: indexPath);
            (cell as? CVCell_Cell_2)?.cellData = (cellItem as? Cell_Item_2);
            break;
        default:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell_Cell_2", for: indexPath);
            (cell as? CVCell_Cell_2)?.cellData = (cellItem as? Cell_Item_2);
            break;
        }
       return cell;
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionItem : Section_item = (dataArray?[section])!;
        let cellData : [Cell_BaseItem] = sectionItem.cellData!;
        return cellData.count;
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return (dataArray?.count)!;
    }

    
}
