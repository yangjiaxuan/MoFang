//
//  WheelView.swift
//  MoFang
//
//  Created by 杨森 on 16/9/19.
//  Copyright © 2016年 sitemap. All rights reserved.


import UIKit

@objc public protocol WheelViewCellProtocol : NSObjectProtocol{
    @objc optional func wheelViewCellSelected(_ index : Int)
}

class WheelViewCell: UIView{
    var _index : Int = 0;
    var _imageName : String? ;
    var _isFromNet : Bool = false;
    var _backImageV : UIImageView? ;
    
    // 定义闭包
    var _imageSelected : ((_ index : Int)->())?
    
    weak var _delegate : WheelViewCellProtocol? ;
    
    init(frame f: CGRect,index : Int, imageName : String, isFromNet : Bool)
    {
        super.init(frame:f);
        _imageName = imageName;
        _isFromNet = isFromNet;
        _index     = index;
        self.setupUI();
        self.addGesture();
    }
    
    func setupUI(){
        
        _backImageV = UIImageView(frame: self.bounds);
        self .addSubview(_backImageV!);
        if _isFromNet {
            
        }
        else{
            _backImageV?.image = UIImage.init(named: _imageName!);
            
        }
    }
    
    func addGesture(){
        
        let tap = UITapGestureRecognizer(target: self, action:#selector(WheelViewCell.tapAction(_:)));
        self.addGestureRecognizer(tap);
        
        
    }
    
    func tapAction(_ sender : UITapGestureRecognizer){
        // MARK: 使用的是代理方法，原理同OC

        let delegateSelector = Selector("wheelViewCellSelected:");
        if (_delegate?.responds(to: delegateSelector)) == true {
            _delegate?.wheelViewCellSelected!(_index);
        }
        
        // MARK: 执行闭包
        if _imageSelected != nil {
            _imageSelected?(_index);
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class WheelView: UIView, WheelViewCellProtocol, UIScrollViewDelegate{

    var _images : [String]?;
    var _timer : Timer? ;
    var _selectedCellWithIndex = {(index : Int)->() in };
    
    lazy var _backScrollView : UIScrollView = {[weak self] in
    
        let scrollView = UIScrollView(frame: self!.bounds);
        self!.addSubview(scrollView);
        return scrollView;
    
    }()
    lazy var _pageControl : UIPageControl = {[weak self] in
    
        let pageConW : CGFloat = 150;
        let pageConH : CGFloat = 10;
        let pageConX : CGFloat = ((self?.width)! - pageConW)/2.0;
        let pageConY : CGFloat = (self?.height)! - pageConH - 10.0;
        let pageCon = UIPageControl(frame: CGRect(x: pageConX,y: pageConY,width: pageConW,height: pageConH));
        pageCon.currentPage = 0;
        pageCon.currentPageIndicatorTintColor = UIColor.purple;
        pageCon.pageIndicatorTintColor = UIColor.white;
        self!.addSubview(pageCon);
        return pageCon;
    
    }()

    override init(frame: CGRect) {
        super.init(frame: frame);
        _backScrollView.isPagingEnabled = true;
        
    }
    
    convenience init(frame f : CGRect, images imageArr : [String]){
        self.init(frame: f);
        _images = imageArr;
        
        self.setupUI();
        self.setTimer();

    }
    
    func setupUI(){
        
        _backScrollView.delegate = self;
        
        var realImages : [String] = _images!;
        realImages.append((_images?.first)!);
        realImages.insert((_images?.last)!, at: 0);
        
        var index : Int = 0;
        for item : String in realImages{
            
            // CGFloat(index) Int -> CGFloat
            let cellRect : CGRect = CGRect(x: CGFloat(index) * self.width!, y: 0, width: self.width!, height: self.height!)
            let cell = WheelViewCell(frame: cellRect, index: (_images?.index(of: item))!, imageName: item, isFromNet: false);
            cell._delegate = self;
            _backScrollView.addSubview(cell);
            
            // MARK: 闭包的方式传值[weak self]是防止循环运用
            cell._imageSelected = {[weak self] (index : Int) -> () in
            
                self?._selectedCellWithIndex(index);
                print("闭包————选中了WhellView的第\(index)个cell");
            
            }
            
            index += 1;
        }
        _backScrollView.contentOffset = CGPoint(x: self.width!, y: 0);
        _backScrollView.contentSize = CGSize(width: self.width! * CGFloat(realImages.count), height: self.height!);
        
        _pageControl.numberOfPages = (_images?.count)!;
    }
    
    func setTimer() {
        _timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(timerGo), userInfo: nil, repeats: true);
    }
    func invalidateTimer(){
        if _timer != nil {
            _timer?.invalidate();
            _timer = nil;
        }
    }
    
    func timerGo(_ timer : Timer){
        self.wheelViewContentOffsetMoveLeft();
    }
    
    func wheelViewContentOffsetMoveLeft(){
        let contentOffset : CGPoint = _backScrollView.contentOffset;
        let nextContentOffsetX : CGFloat = contentOffset.x + self.width!;

        UIView.animate(withDuration: 0.5, animations: {[weak self] in
            self!._backScrollView.contentOffset = CGPoint(x: nextContentOffsetX, y: 0);
        }, completion: { (finished : Bool) in
            if finished{
                self.wheelViewContentOffsetDidMovePoint(self._backScrollView.contentOffset);
            }
        }) 
    }
    
    func wheelViewContentOffsetDidMovePoint(_ point : CGPoint){
        var pointX : CGFloat = point.x;
        if pointX > self.width! * CGFloat((_images?.count )!) {
            pointX = self.width!;
        }
        if pointX < self.width!{
            pointX = self.width! * CGFloat((self._images?.count)!);
        }
        self._backScrollView.setContentOffset(CGPoint(x: pointX, y: 0), animated: false);
        _pageControl.currentPage = NSInteger(pointX/self.width! - 1);
    }
    
    // MARK: ScrollView 代理
    // 手动开始滑动
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.invalidateTimer();
    }
    // 手动滑动结束
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.setTimer();
        self.wheelViewContentOffsetDidMovePoint(scrollView.contentOffset);

    }
    
    // MARK: wheelCell 代理执行的方法
    func wheelViewCellSelected(_ index: Int) {
        self._selectedCellWithIndex(index);
        print("代理————选中了WhellView的第\(index)个cell");
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


