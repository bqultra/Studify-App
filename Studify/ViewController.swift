//
//  ViewController.swift
//  Studify
//
//  Created by Szymek on 17/04/2021.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Hex colors
        let colorBars = UIColor(hex: 0x242424) //Top Bar and Tab Bar
        let textColor = UIColor(hex: 0xFF8000) //Title
        
        //NavigationController config
        UINavigationBar.appearance().barTintColor = colorBars
        let attributes = [NSAttributedString.Key.font: UIFont(name: "SignPainter", size: 36)!, NSAttributedString.Key.foregroundColor: textColor]
        UINavigationBar.appearance().titleTextAttributes = attributes
        
        //TabBar Config
        UITabBar.appearance().barTintColor = colorBars
        
        
    }

}

class CustomTabBar: UITabBar {
        
     override func awakeFromNib() {
            super.awakeFromNib()
            layer.masksToBounds = true
            layer.cornerRadius = 20
            layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
      }
    
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else {
            return super.sizeThatFits(size)
        }
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = window.safeAreaInsets.bottom + 60
        return sizeThatFits
    }
 }

//UIColor -> Hex
extension UIColor {

    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }

}

extension CGColor {

    class func colorWithHex(hex: Int) -> CGColor {

        return UIColor(hex: hex).cgColor

    }

}


