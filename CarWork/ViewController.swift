//
//  ViewController.swift
//  CarWork
//
//  Created by Hannah Zulueta on 9/11/18.
//  Copyright © 2018 Hannah Zulueta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Top icon
        let layer = UIView(frame: CGRect(x: 30, y: 90, width: 74, height: 70))
        layer.layer.shadowOffset = CGSize(width: 0, height: 7)
        layer.layer.shadowColor = UIColor(red:0, green:0, blue:0, alpha:0.5).cgColor
        layer.layer.shadowOpacity = 1
        layer.layer.shadowRadius = 4
        self.view.addSubview(layer)
        
        //Description
        let textLayer = UILabel(frame: CGRect(x: 30, y: 180, width: 315, height: 184))
        textLayer.lineBreakMode = .byWordWrapping
        textLayer.numberOfLines = 0
        textLayer.textColor = UIColor(red:0.2, green:0.2, blue:0.2, alpha:1)
        let textContent = "Bring your next event and check who you are going to meet!"
        let textString = NSMutableAttributedString(string: textContent, attributes: [
            NSAttributedStringKey.font: UIFont(name: "Avenir-Black", size: 32)!
            ])
        let textRange = NSRange(location: 0, length: textString.length)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 1.44
        textString.addAttribute(NSAttributedStringKey.paragraphStyle, value:paragraphStyle, range: textRange)
        textLayer.attributedText = textString
        textLayer.sizeToFit()
        self.view.addSubview(textLayer)
        
        //Email
        
        let layer1 = UIView(frame: CGRect(x: 24, y: 393, width: 327, height: 52))
        layer1.layer.cornerRadius = 4
        layer1.backgroundColor = UIColor(red:0.09, green:0.73, blue:0.16, alpha:1)
        self.view.addSubview(layer1)
        
        let textLayer1 = UILabel(frame: CGRect(x: 45, y: 410, width: 285, height: 20))
        textLayer1.lineBreakMode = .byWordWrapping
        textLayer1.numberOfLines = 0
        textLayer1.textColor = UIColor.white
        textLayer1.textAlignment = .center
        let textContent1 = "Email"
        let textString1 = NSMutableAttributedString(string: textContent1, attributes: [
            NSAttributedStringKey.paragraphStyle: UIFont(name: "Avenir-Book", size: 16)!
            ])
        let textRange1 = NSRange(location: 0, length: textString1.length)
        let paragraphStyle1 = NSMutableParagraphStyle()
        paragraphStyle1.lineSpacing = 1.25
        textString1.addAttribute(NSAttributedStringKey.paragraphStyle, value:paragraphStyle, range: textRange1)
        textLayer1.attributedText = textString1
        textLayer1.sizeToFit()
        self.view.addSubview(textLayer1)
        
        //Facebook
        let layer2 = UIView(frame: CGRect(x: 24, y: 457, width: 327, height: 52))
        layer2.layer.cornerRadius = 4
        layer2.backgroundColor = UIColor(red:0.09, green:0.73, blue:0.16, alpha:1)
        self.view.addSubview(layer2)
        
        let textLayer2 = UILabel(frame: CGRect(x: 45, y: 474, width: 285, height: 20))
        textLayer2.lineBreakMode = .byWordWrapping
        textLayer2.numberOfLines = 0
        textLayer2.textColor = UIColor.white
        textLayer2.textAlignment = .center
        let textContent2 = "Facebook"
        let textString2 = NSMutableAttributedString(string: textContent2, attributes: [
            NSAttributedStringKey.paragraphStyle: UIFont(name: "Avenir-Book", size: 16)!
            ])
        let textRange2 = NSRange(location: 0, length: textString2.length)
        let paragraphStyle2 = NSMutableParagraphStyle()
        paragraphStyle2.lineSpacing = 1.25
        textString2.addAttribute(NSAttributedStringKey.paragraphStyle, value:paragraphStyle, range: textRange2)
        textLayer2.attributedText = textString2
        textLayer2.sizeToFit()
        self.view.addSubview(textLayer2)
        
        //Google
        let layer3 = UIView(frame: CGRect(x: 24, y: 521, width: 327, height: 52))
        layer3.layer.cornerRadius = 4
        layer3.backgroundColor = UIColor(red:0.09, green:0.73, blue:0.16, alpha:1)
        self.view.addSubview(layer3)
        
        let textLayer3 = UILabel(frame: CGRect(x: 45, y: 538, width: 285, height: 20))
        textLayer3.lineBreakMode = .byWordWrapping
        textLayer3.numberOfLines = 0
        textLayer3.textColor = UIColor.white
        textLayer3.textAlignment = .center
        let textContent3 = "Google"
        let textString3 = NSMutableAttributedString(string: textContent3, attributes: [
            NSAttributedStringKey.paragraphStyle: UIFont(name: "Avenir-Book", size: 16)!
            ])
        let textRange3 = NSRange(location: 0, length: textString3.length)
        let paragraphStyle3 = NSMutableParagraphStyle()
        paragraphStyle3.lineSpacing = 1.25
        textString3.addAttribute(NSAttributedStringKey.paragraphStyle, value:paragraphStyle, range: textRange3)
        textLayer3.attributedText = textString3
        textLayer3.sizeToFit()
        self.view.addSubview(textLayer3)
        
        //LinkedIn
        let layer4 = UIView(frame: CGRect(x: 24, y: 585, width: 327, height: 52))
        layer4.layer.cornerRadius = 4
        layer4.backgroundColor = UIColor(red:0.09, green:0.73, blue:0.16, alpha:1)
        self.view.addSubview(layer4)
        
        let textLayer4 = UILabel(frame: CGRect(x: 45, y: 602, width: 285, height: 20))
        textLayer4.lineBreakMode = .byWordWrapping
        textLayer4.numberOfLines = 0
        textLayer4.textColor = UIColor.white
        textLayer4.textAlignment = .center
        let textContent4 = "LinkedIn"
        let textString4 = NSMutableAttributedString(string: textContent4, attributes: [
            NSAttributedStringKey.paragraphStyle: UIFont(name: "Avenir-Book", size: 16)!
            ])
        let textRange4 = NSRange(location: 0, length: textString4.length)
        let paragraphStyle4 = NSMutableParagraphStyle()
        paragraphStyle4.lineSpacing = 1.25
        textString4.addAttribute(NSAttributedStringKey.paragraphStyle, value:paragraphStyle, range: textRange4)
        textLayer4.attributedText = textString4
        textLayer4.sizeToFit()
        self.view.addSubview(textLayer4)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

