//
//  AutoLayout.swift
//  BourseV2
//
//  Created by Med Beji on 01/07/2016.
//  Copyright © 2016 alphalab. All rights reserved.
//

import UIKit

struct FontSizes {
    static var s12 : CGFloat {
        return 12.0+self.delta
    }
    static var s13 : CGFloat {
        return 13.0+self.delta
    }
    static var s14 : CGFloat {
        return 14.0+self.delta
    }
    static var s15 : CGFloat {
        return 16.0+self.delta
    }
    static var s16 : CGFloat {
        return 16.0+self.delta
    }
    static var s17 : CGFloat {
        return 17.0+self.delta
    }
    static var s18 : CGFloat {
        return 18.0+self.delta
    }
    static var s19 : CGFloat {
        return 19.0+self.delta
    }
    static var s20 : CGFloat {
        return 20.0+self.delta
    }
    static var s21 : CGFloat {
        return 21.0+self.delta
    }
    static var s22 : CGFloat {
        return 22.0+self.delta
    }
    static var s23 : CGFloat {
        return 23.0+self.delta
    }
    static var s24 : CGFloat {
        return 24.0+self.delta
    }
    static var s25 : CGFloat {
        return 25.0+self.delta
    }
    
    static var delta : CGFloat {
        if UIDevice.isDeviceWithHeight480() {
            return 0;
        }else if UIDevice.isDeviceWithHeight568() {
            return 1;
        }else if UIDevice.isDeviceWithHeight667() {
            return 2;
        }else{
            return 3;
        }
    }
}



extension UIDevice {
    class func isDeviceWithWidth320 () -> Bool {
        if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone {
            if UIScreen.mainScreen().bounds.size.width == CGFloat(320.0) {
                return true;
            }
        }
        return false;
    }
    
    class func isDeviceWithWidth375 () -> Bool {
        if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone {
            if UIScreen.mainScreen().bounds.size.width == CGFloat(375.0) {
                return true;
            }
        }
        return false;
    }
    
    class func isDeviceWithWidth414 () -> Bool {
        if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone {
            if UIScreen.mainScreen().bounds.size.width == CGFloat(414.0) {
                return true;
            }
        }
        return false;
    }
    
    class func isDeviceWithHeight480 () -> Bool {
        if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone {
            if UIScreen.mainScreen().bounds.size.height == CGFloat(480.0) {
                return true;
            }
        }
        return false;
    }
    
    class func isDeviceWithHeight568 () -> Bool {
        if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone {
            if UIScreen.mainScreen().bounds.size.height == CGFloat(568.0) {
                return true;
            }
        }
        return false;
    }
    
    class func isDeviceWithHeight667 () -> Bool {
        if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone {
            if UIScreen.mainScreen().bounds.size.height == CGFloat(667.0) {
                return true;
            }
        }
        return false;
    }
    
    class func isDeviceWithHeight736 () -> Bool {
        if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone {
            if UIScreen.mainScreen().bounds.size.height == CGFloat(736.0) {
                return true;
            }
        }
        return false;
    }
}



// Adaptable size
func adaptableFontSize(minSize : CGFloat , increment : CGFloat ) -> CGFloat {
    
    if UIScreen.mainScreen().bounds.size.height == 480 {
        // iPhone 4
        return minSize
    } else if UIScreen.mainScreen().bounds.size.height == 568 {
        // IPhone 5
        return minSize  + increment
    } else if UIScreen.mainScreen().bounds.size.width == 375 {
        // iPhone 6
        return minSize  + increment  + 1
    } else if UIScreen.mainScreen().bounds.size.width == 414 {
        // iPhone 6+
        return minSize  + increment + 2
    } else if UIScreen.mainScreen().bounds.size.width == 768 {
        // iPad
        return minSize  + increment + 3
    }
    return minSize
}

