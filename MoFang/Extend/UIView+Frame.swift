//
//  UIView+Frame.swift
//  MoFang
//
//  Created by 杨森 on 16/9/19.
//  Copyright © 2016年 sitemap. All rights reserved.
//

import UIKit
extension UIView{

    var x : CGFloat?{
    
        get{
            return self.frame.origin.x;
        }
        
        set{
            self.frame.origin.x = newValue!;
        }
    }
    
    var y : CGFloat?{
        
        get{
            return self.frame.origin.y;
        }
        
        set{
            self.frame.origin.y = newValue!;
        }
    }
    
    var width : CGFloat?{
    
        get{
            return self.frame.width;
        }
        
        set{
            self.frame.size.width = newValue!;
        }
    
    }
    
    var height : CGFloat?{
        
        get{
            return self.frame.height;
        }
        
        set{
            self.frame.size.height = newValue!;
        }
        
    }
    
    var centerX : CGFloat?{
        
        get{
            return self.center.x;
        }
        
        set{
            self.center.x       = newValue!;
            self.frame.origin.x = newValue! - self.width!/2;
        }
    }
    
    var centerY : CGFloat?{
        
        get{
            return self.center.y;
        }
        
        set{
            self.center.y       = newValue!;
            self.frame.origin.y = newValue! - self.height!/2;
        }
    }
    
    
    

}