//
//  CalendrierCustomCell.swift
//  BourseV2
//
//  Created by Med Beji on 01/07/2016.
//  Copyright © 2016 alphalab. All rights reserved.
//

import UIKit

class CalendrierCustomCell : BaseCell {
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(230, green: 230, blue: 230)
        return view
    }()
    let verticalSep1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(230, green: 230, blue: 230)
        return view
    }()
    let verticalSep2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(230, green: 230, blue: 230)
        return view
    }()
    
    
    let titleCol: UILabel = {
        let text = UILabel()
        text.backgroundColor = UIColor.brownColor()
        text.text = "Royaume Uni: -0,4 % de production industrielle en juin"
        text.font = UIFont.systemFontOfSize(FontSizes.s15)
        text.numberOfLines = 2
        return text
    }()
    
    
    
    let hourLabel: UILabel = {
        let text = UILabel()
        text.backgroundColor = UIColor.greenColor()
        text.text  = "10:00"
        text.font = UIFont.systemFontOfSize(FontSizes.s14)
        text.adjustsFontSizeToFitWidth = true
        return text
    }()
    
    let level1:UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor.grayColor()
        iv.tintColor = UIColor.lightGrayColor()
        iv.contentMode = .ScaleAspectFill
        return iv
    }()
    let level2:UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor.grayColor()
        iv.tintColor = UIColor.lightGrayColor()
        iv.contentMode = .ScaleAspectFill
        return iv
    }()
    let level3:UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor.grayColor()
        iv.tintColor = UIColor.lightGrayColor()
        iv.contentMode = .ScaleAspectFill
        return iv
    }()
    
    
    let countryLabel : UILabel = {
        let text = UILabel()
        text.backgroundColor = UIColor.purpleColor()
        text.text = "SGD"
        text.font = UIFont.systemFontOfSize(FontSizes.s14)
        return text
    }()
    
    
    
    
    let countryImage:UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor.redColor()
        iv.tintColor = UIColor.lightGrayColor()
        iv.contentMode = .ScaleAspectFill
        return iv
    }()
    
    
    
    let prevue : UILabel = {
        let text = UILabel()
        text.backgroundColor = UIColor.grayColor()
        text.text = "Prevue"
        text.font = UIFont.systemFontOfSize(FontSizes.s14)
        return text
    }()
    
    let prevueVal : UILabel = {
        let text = UILabel()
        text.backgroundColor = UIColor.grayColor()
        text.text = "250.1B"
        text.font = UIFont.systemFontOfSize(FontSizes.s14)
        return text
    }()
    
    let prs:UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor.grayColor()
        iv.tintColor = UIColor.lightGrayColor()
        iv.contentMode = .ScaleAspectFill
        return iv
    }()
    
    let prsVal : UILabel = {
        let text = UILabel()
        text.backgroundColor = UIColor.grayColor()
        text.text = "250.1B"
        text.font = UIFont.systemFontOfSize(FontSizes.s14)
        return text
    }()
    
    let veille : UILabel = {
        let text = UILabel()
        text.backgroundColor = UIColor.grayColor()
        text.text = "250.1B"
        text.font = UIFont.systemFontOfSize(FontSizes.s14)
        return text
    }()
    
    let veilleVal : UILabel = {
        let text = UILabel()
        text.backgroundColor = UIColor.grayColor()
        text.text = "250.1B"
        text.font = UIFont.systemFontOfSize(FontSizes.s14)
        return text
    }()
    
    func changingPrevueValue(isloading: Bool, val: String) {
        if isloading {
            // add prevue Loading to view 
            // delete value
            
        } else {
            // add value 
            // delete loading image
        }
    }
    
    override func setupViews() {
        backgroundColor = UIColor.blueColor()
        addSubview(separatorView)
        addSubview(hourLabel)
        addSubview(countryLabel)
        addSubview(titleCol)
        addSubview(level1)
        addSubview(level2)
        addSubview(level3)
        addSubview(countryImage)
        addSubview(prs)
        addSubview(prsVal)
        addSubview(verticalSep1)
        addSubview(prevue)
        addSubview(prevueVal)
        addSubview(verticalSep2)
        addSubview(veille)
        addSubview(veilleVal)
        
        // Setting the layouts for Hour , CountryLabel , Title
        //Horizontal layout
        addConstraintsWithFormat("H:|-8-[v0(40)]-5-[v1(40)]-5-[v2(1)]-5-[v3]-2-|", views: hourLabel,countryLabel,separatorView,titleCol)
        
        // Vertical layout
        addConstraintsWithFormat("V:|-5-[v0(35)]", views: hourLabel)
        addConstraintsWithFormat("V:|-5-[v0]-5-|", views: separatorView)
        addConstraintsWithFormat("V:|-5-[v0(35)]", views: countryLabel)
        addConstraintsWithFormat("V:|-2-[v0]", views: titleCol)
        
        
        //Setting layout for the Rest
        // Horizontal layout
        addConstraintsWithFormat("|-8-[v0(13)]-1-[v1(13)]-1-[v2(13)]-10-[v3(30)]", views: level1,level2,level3,countryImage)
        addConstraintsWithFormat("V:|-47-[v0(15)]", views: level1)
        addConstraintsWithFormat("V:|-47-[v0(15)]", views: level2)
        addConstraintsWithFormat("V:|-47-[v0(15)]", views: level3)
        addConstraintsWithFormat("V:|-42-[v0(25)]", views: countryImage)
        
        
        
        
    }
    
}