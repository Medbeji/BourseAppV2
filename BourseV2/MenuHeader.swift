//
//  MenuHeader.swift
//  BourseV2
//
//  Created by Med Beji on 25/06/2016.
//  Copyright © 2016 alphalab. All rights reserved.
//

import UIKit

class MenuHeader : UIView {
    
    override init(frame: CGRect) {
        super.init(frame:  frame)
        
        settingVIew()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    let priceLabel : UILabel  = {
        let price = UILabel()
        price.text = "5.189,50"
        price.font = UIFont.boldSystemFontOfSize(25)
        return price
    }()
    
    
    let percentage: UILabel = {
        let text = UILabel()
        text.text = "-3,80 (-0,03%)"
        text.textColor = UIColor.redColor()
        text.font =  UIFont.boldSystemFontOfSize(21)
        return text
    }()
    
    let  timeDescription: UILabel = {
        let text = UILabel()
        text.text = "10:07:50 - CFD en temps réel"
        text.textColor = UIColor.lightGrayColor()
        text.font =  UIFont.systemFontOfSize(15)
        return text
    }()
    
    
    
    func settingVIew(){
        
        addSubview(priceLabel)
        addSubview(percentage)
        addSubview(timeDescription)
        backgroundColor = UIColor.rgb(236, green: 236, blue: 236)
        addConstraintsWithFormat("H:|-35-[v0]-30-[v1]", views: priceLabel,percentage)
        addConstraintsWithFormat("V:|-16-[v0(40)]-4-[v1]", views: priceLabel,timeDescription)
        addConstraintsWithFormat("H:|-35-[v0]", views: timeDescription)
        addConstraintsWithFormat("V:|-18-[v0(40)]", views: percentage)
        
        
        
    }
    
}