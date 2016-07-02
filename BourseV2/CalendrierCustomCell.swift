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
        text.text = "Royaume Uni: -0,4 % de production industrielle en juin"
        //        text.font = UIFont.systemFontOfSize(FontSizes.s14)
        text.font = UIFont (name: "Helvetica Neue", size: FontSizes.s14)
        text.numberOfLines = 2
        return text
    }()
    
    
    
    let hourLabel: UILabel = {
        let text = UILabel()
        
        text.textColor = UIColor.grayColor()
        text.text  = "10:00"
        text.font = UIFont.systemFontOfSize(FontSizes.s15)
        //        text.adjustsFontSizeToFitWidth = true
        return text
    }()
    
    let level1:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "taurus")?.imageWithRenderingMode(.AlwaysTemplate)
        //        iv.backgroundColor = UIColor.grayColor()
        iv.tintColor = UIColor.grayColor()
        iv.contentMode = .ScaleAspectFill
        return iv
    }()
    let level2:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "taurus")?.imageWithRenderingMode(.AlwaysTemplate)
        //        iv.backgroundColor = UIColor.grayColor()
        iv.tintColor = UIColor.lightGrayColor()
        iv.contentMode = .ScaleAspectFill
        return iv
    }()
    let level3:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "taurus")?.imageWithRenderingMode(.AlwaysTemplate)
        //        iv.backgroundColor = UIColor.grayColor()
        iv.tintColor = UIColor.lightGrayColor()
        iv.contentMode = .ScaleAspectFill
        return iv
    }()
    
    
    let countryLabel : UILabel = {
        let text = UILabel()
        text.text = "SGD"
        text.font = UIFont.systemFontOfSize(FontSizes.s15)
        text.textAlignment = .Center
        return text
    }()
    
    
    
    
    let countryImage:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "uk")
        iv.contentMode = .ScaleAspectFill
        return iv
    }()
    
    
    
    let prevue : UILabel = {
        let text = UILabel()
        text.textColor = UIColor.grayColor()
        text.text = "Prevue"
        text.font = UIFont.systemFontOfSize(FontSizes.s13)
        return text
    }()
    
    let prevueVal : UILabel = {
        let text = UILabel()
        text.textColor = UIColor.blackColor()
        text.text = "0"
        text.font = UIFont.systemFontOfSize(FontSizes.s13)
        return text
    }()
    
    let prs : UILabel = {
        let text = UILabel()
        text.textColor = UIColor.grayColor()
        text.text = "Prs"
        text.font = UIFont.systemFontOfSize(FontSizes.s13)
        return text
    }()
    
    let prsVal : UILabel = {
        let text = UILabel()
        text.textColor = UIColor.blackColor()
        text.text = "250.1B"
        text.font = UIFont.systemFontOfSize(FontSizes.s13)
        return text
    }()
    
    let veille : UILabel = {
        let text = UILabel()
        text.textColor = UIColor.grayColor()
        text.text = "Veille"
        text.font = UIFont.systemFontOfSize(FontSizes.s13)
        return text
    }()
    
    let veilleVal : UILabel = {
        let text = UILabel()
        text.textColor = UIColor.blackColor()
        text.text = "250.1B"
        text.font = UIFont.systemFontOfSize(FontSizes.s13)
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
        backgroundColor = UIColor.whiteColor()
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
        addConstraintsWithFormat("H:|-6-[v0]-3-[v1]-5-[v2(1)]-5-[v3(220)]", views: hourLabel,countryLabel,separatorView,titleCol)
        
        // Vertical layout
        addConstraintsWithFormat("V:|-5-[v0(35)]", views: hourLabel)
        addConstraintsWithFormat("V:|-5-[v0]-5-|", views: separatorView)
        addConstraintsWithFormat("V:|-5-[v0(35)]", views: countryLabel)
        addConstraintsWithFormat("V:|-2-[v0(50)]", views: titleCol)
        
        
        //Setting layout for levels and country flag
        
        // Horizontal layout
        addConstraintsWithFormat("H:|-8-[v0(13)]-1-[v1(13)]-1-[v2(13)]-10-[v3(30)]", views: level1,level2,level3,countryImage)
        // Vertical layout
        addConstraintsWithFormat("V:|-47-[v0(17)]", views: level1)
        addConstraintsWithFormat("V:|-47-[v0(17)]", views: level2)
        addConstraintsWithFormat("V:|-47-[v0(17)]", views: level3)
        addConstraintsWithFormat("V:|-42-[v0(25)]", views: countryImage)
        
        //Setting layout for Prs , prévue et veille
        addConstraintsWithFormat("H:|-104-[v0]-1-[v1]-2-[v2(1)]-2-[v3]-1-[v4]-2-[v5(1)]-2-[v6]-1-[v7]",views: prs,prsVal,verticalSep1,prevue,prevueVal,verticalSep2,veille,veilleVal )
        addConstraintsWithFormat("V:|-52-[v0(20)]", views: prs)
        addConstraintsWithFormat("V:|-52-[v0(20)]", views: prsVal)
        addConstraintsWithFormat("V:|-52-[v0(20)]", views: verticalSep1)
        addConstraintsWithFormat("V:|-52-[v0(20)]", views: prevue)
        addConstraintsWithFormat("V:|-52-[v0(20)]", views: prevueVal)
        addConstraintsWithFormat("V:|-52-[v0(20)]", views: verticalSep2)
        addConstraintsWithFormat("V:|-52-[v0(20)]", views: veille)
        addConstraintsWithFormat("V:|-52-[v0(20)]", views: veilleVal)
        
        
        
    }
    
}