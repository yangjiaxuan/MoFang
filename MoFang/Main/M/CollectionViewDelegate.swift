//
//  CollectionViewDelegate.swift
//  MoFang
//
//  Created by 杨森 on 16/9/20.
//  Copyright © 2016年 sitemap. All rights reserved.
//

import UIKit

typealias CellSelectedHander = (_ collectionView: UICollectionView, _ indexPath: IndexPath)->()
class CollectionViewDelegate: NSObject, UICollectionViewDelegateFlowLayout {

    var _cellSelectedHander : (_ collectionView: UICollectionView, _ indexPath: IndexPath)->()?;
    var _dataArray : [Section_item]?;
        
    init(dataArray : [Section_item], cellSelectedHander : @escaping CellSelectedHander) {
        _cellSelectedHander = cellSelectedHander;
        _dataArray          = dataArray;
        super.init();
    }
    
    // 选择某个cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        _cellSelectedHander(collectionView, indexPath);
    }
    
    // cell的大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellItem : Cell_BaseItem = (_dataArray![(indexPath as NSIndexPath).section] as Section_item).cellData![(indexPath as NSIndexPath).row];
        return cellItem.size!;
    }
    
    // 行距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        let sectionItem : Section_item = _dataArray![section];
        return sectionItem.sectionMinSpace;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        
        let sectionItem : Section_item = _dataArray![section];
        return sectionItem.sectionMinInterSapce;
    }
    // 边界
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let sectionItem : Section_item = _dataArray![section];
        return sectionItem.sectionInsets;
    }

    
}
