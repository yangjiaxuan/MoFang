//
//  MainVC.swift
//  MoFang
//
//  Created by 杨森 on 16/9/19.
//  Copyright © 2016年 sitemap. All rights reserved.
//

import UIKit

class MainVC: BaseVC{

    var _wheelView : WheelView? ;
    var _collectionView : UICollectionView? ;
    var _CVDelegate : CollectionViewDelegate? ;
    var _CVDataSource : CollectionViewDataSource? ;
    
    
    lazy var _dataArray : [Section_item] = {
    
        var cellData : [Cell_BaseItem]   = [Cell_BaseItem]();
        var sectionData : [Section_item] = [Section_item]();
        
        // MARK: WheelView
        let cellWheelView: Cell_Item_WheelView = Cell_Item_WheelView();
        cellWheelView.title    = "黄焖鸡";
        cellWheelView.cellType = CellType.wheelView;
        cellWheelView.image    = ["1","2","3"];
        cellData.append(cellWheelView);
        
        
        // MARK: 第一组
        let cellHeaderItem : Cell_HeaderItem = Cell_HeaderItem();
        cellHeaderItem.title = "黄焖鸡";
        cellHeaderItem.cellType = CellType.header;
        cellData.append(cellHeaderItem);
        
        let sectionItem : Section_item = Section_item();
        for index : Int in 1...31 {
            
            let cellItem : Cell_Item_2 = Cell_Item_2();
            cellItem.cellType = CellType.cell_4;
            cellItem.image = "tu";
            cellItem.title = "1111";
            cellData.append(cellItem);
        }
        sectionItem.cellData = cellData;
        sectionData.append(sectionItem);
        
        // MARK: 第二组
        var cellData1 : [Cell_BaseItem]   = [Cell_BaseItem]();
        let sectionItem1 : Section_item = Section_item();
        let cellItem : Cell_Item_1 = Cell_Item_1();
        cellItem.cellType = CellType.cell_1;
        cellItem.image = "1";
        cellData1.append(cellItem);
        
        sectionItem1.cellData = cellData1;
        sectionData.append(sectionItem1);
        
        // MARK: 第三组
        var cellData2 : [Cell_BaseItem]   = [Cell_BaseItem]();
        let cellHeaderItem2 : Cell_HeaderItem = Cell_HeaderItem();
        cellHeaderItem2.title = "黄焖鸡2";
        cellHeaderItem2.cellType = CellType.header;
        cellData2.append(cellHeaderItem2);
        
        let sectionItem2 : Section_item = Section_item();
        for index : Int in 1...32 {
            
            let cellItem : Cell_Item_1 = Cell_Item_1();
            cellItem.cellType = CellType.cell_3;
            cellItem.image = "tu";
            cellItem.title = "222";
            cellData2.append(cellItem);
        }
        
        sectionItem2.cellData = cellData2;
        sectionData.append(sectionItem2);
        return sectionData;
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "主页";
        
        setupData();
        setupUI();
        
    }

    func setupUI(){
        
        self.automaticallyAdjustsScrollViewInsets = false;
        _wheelView = WheelView.init(frame: CGRect(x: 0, y: 64, width: self.view.width!, height: self.view.width! * 0.6), images: ["2","1"]);
        
        let flowLayout = UICollectionViewFlowLayout();
        flowLayout.itemSize = CGSize(width: 0, height: 0);
        
        _collectionView = UICollectionView(frame:CGRect(x: 0, y: 64, width: SCREEN_W, height: SCREEN_H - 64 - 49), collectionViewLayout:flowLayout);
        _CVDelegate = CollectionViewDelegate(dataArray:_dataArray, cellSelectedHander: {[weak self] (collectionView : UICollectionView, indexPah : IndexPath) in
            
                print("VC选中了第\(indexPah.section)组，第\(indexPah.row)个元素");

            
            });
        
        _collectionView?.delegate   =  _CVDelegate;
        
        _CVDataSource = CollectionViewDataSource(dataArray : _dataArray, btnActionHander: {[weak self] (indexPath : IndexPath, actionType : ActionType, actionTag : Int)->() in
            
            let sectionItem : Section_item = (self?._dataArray[(indexPath as NSIndexPath).section])!;
            let item : Cell_BaseItem = (sectionItem.cellData![(indexPath as NSIndexPath).row]);
            switch item.cellType!{
                case CellType.wheelView:
                print("VC选中了第\(indexPath.section)组，第\(indexPath.row)个WheelView的第\(actionTag)张图片");
                break;
            case CellType.header:
                print("VC选中了第\(indexPath.section)组，第\(indexPath.row)个元素   的按钮");
                break;
            default:
                print("VC选中了第\(indexPath.section)组，第\(indexPath.row)个元素");
                break;
            }
;
        });
        _collectionView?.dataSource = _CVDataSource;
        
        _collectionView?.register(CVCell_WheelView.self, forCellWithReuseIdentifier: "CVCell_WheelView");
        
        _collectionView?.register(UINib.init(nibName: "CVCell_Header", bundle: nil), forCellWithReuseIdentifier: "CVCell_Header");
        
        _collectionView?.register(CVCell_Cell_1.self, forCellWithReuseIdentifier: "CVCell_Cell_1");
        
        _collectionView?.register(UINib.init(nibName: "CVCell_Cell_2", bundle: nil) , forCellWithReuseIdentifier: "CVCell_Cell_2");
        
        self.view.addSubview(_collectionView!);
        
    }
    
    func setupData(){
        
    }
}
