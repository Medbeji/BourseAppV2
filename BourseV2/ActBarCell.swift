//
//  ActBarCell.swift
//  BourseV2
//
//  Created by Med Beji on 25/06/2016.
//  Copyright © 2016 alphalab. All rights reserved.
//

import UIKit
class ActBarCell : BaseCell {
    
    let actBarLabel : UILabel = {
        let abl = UILabel()
        
        abl.text = "CAC 40 Actualités"
        return abl
        
    }()
    
    let verticalSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(230, green: 230, blue: 230)
        return view
    }()
    
    let image : UIImageView = {
        let img = UIImageView()
        
        img.image = UIImage(named : "next")?.imageWithRenderingMode(.AlwaysTemplate)
        img.tintColor = UIColor.lightGrayColor()
        img.contentMode = .ScaleAspectFill
        return img
    }()
    
    override func setupViews() {
        backgroundColor = UIColor.rgb(239, green: 239, blue: 239)
        
        addSubview(actBarLabel)
        addSubview(verticalSeparator)
        addSubview(image)
        
        addConstraintsWithFormat("H:|-16-[v0][v1(1)]-2-[v2(20)]-2-|", views: actBarLabel,verticalSeparator,image)
        addConstraintsWithFormat("V:|-2-[v0(30)]", views: image)
        addConstraintsWithFormat("V:|[v0]|", views: actBarLabel)
        addConstraintsWithFormat("V:|-2-[v0]-2-|", views: verticalSeparator)
        
    }
}