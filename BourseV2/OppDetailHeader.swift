//
//  OppDetailHeader.swift
//  BourseV2
//
//  Created by Med Beji on 25/06/2016.
//  Copyright © 2016 alphalab. All rights reserved.
//

import UIKit

class OppDetailHeader: BaseCell {
    
    let priceLabel : UILabel  = {
        let price = UILabel()
        price.text = "5.189,50"
        price.font = UIFont.boldSystemFontOfSize(FontSizes.s25)
        return price
    }()
    
    
    let percentage: UILabel = {
        let text = UILabel()
        text.text = "-3,80 (-0,03%)"
        text.textColor = UIColor.redColor()
        text.font =  UIFont.boldSystemFontOfSize(FontSizes.s21)
        return text
    }()
    
    let  timeDescription: UILabel = {
        let text = UILabel()
        text.text = "10:07:50 - CFD en temps réel"
        text.textColor = UIColor.lightGrayColor()
        text.font =  UIFont.systemFontOfSize(FontSizes.s15)
        return text
    }()
    
    let menuBar: DetailSubMenu = {
        let mb = DetailSubMenu()
        return mb
    }()
    
    override func setupViews() {
        
        addSubview(priceLabel)
        addSubview(percentage)
        addSubview(timeDescription)
        addSubview(menuBar)
        backgroundColor = UIColor.rgb(236, green: 236, blue: 236)
        addConstraintsWithFormat("H:|-35-[v0]-30-[v1]", views: priceLabel,percentage)
        addConstraintsWithFormat("V:|-16-[v0(40)]-4-[v1]-16-[v2]|", views: priceLabel,timeDescription,menuBar)
        addConstraintsWithFormat("H:|-35-[v0]", views: timeDescription)
        addConstraintsWithFormat("V:|-18-[v0(40)]", views: percentage)
        addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        
    }
    
}




