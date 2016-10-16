//
//  AdvancedNewView.swift
//  iDesign
//
//  Created by Kennan Mell on 10/16/16.
//  Copyright © 2016 Kennan Mell. All rights reserved.
//

import UIKit

class AdvancedNewView: UIView {
    let backgroundView = UIView()
    let title1 = UILabel()
    let textRed = UITextField()
    let textGreen = UITextField()
    let textBlue = UITextField()
    let textAlpha = UITextField()
    let textFont = UITextField()
    let textSize = UITextField()
    let textText = UITextField()
    let otherLabel = UILabel()
    let otherRed = UITextField()
    let otherGreen = UITextField()
    let otherBlue = UITextField()
    let otherAlpha = UITextField()
    let cornerRadius = UITextField()
    let doneButton = UIButton()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    private func initialize() {
        backgroundView.layer.cornerRadius = 5.0
        backgroundView.layer.masksToBounds = true
        backgroundView.layer.borderColor = UIColor(white: 120.0 / 255.0, alpha: 1.0).cgColor
        backgroundView.backgroundColor = UIColor(white: 220.0 / 255.0, alpha: 1.0)
        backgroundView.layer.borderWidth = 2.0
        addSubview(backgroundView)
        
        title1.text = "Text"
        title1.textColor = UIColor.black
        title1.font = UIFont.boldSystemFont(ofSize: 20)
        addSubview(title1)
        
        otherLabel.text = "Background"
        otherLabel.textColor = UIColor.black
        otherLabel.font = UIFont.boldSystemFont(ofSize: 20)
        addSubview(otherLabel)
        
        self.backgroundColor = UIColor(white: 100.0 / 255.0, alpha: 0.65)
        
        textRed.returnKeyType = .done
        textRed.placeholder = " R"
        textRed.layer.cornerRadius = 5.0
        textRed.layer.masksToBounds = true
        textRed.layer.borderColor = UIColor(red: 153.0 / 255.0, green: 50.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0).cgColor
        textRed.layer.borderWidth = 2.0
        addSubview(textRed)
        
        textGreen.returnKeyType = .done
        textGreen.placeholder = " G"
        textGreen.layer.cornerRadius = 5.0
        textGreen.layer.masksToBounds = true
        textGreen.layer.borderColor = UIColor(red: 153.0 / 255.0, green: 50.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0).cgColor
        textGreen.layer.borderWidth = 2.0
        addSubview(textGreen)
        
        textBlue.returnKeyType = .done
        textBlue.placeholder = " B"
        textBlue.layer.cornerRadius = 5.0
        textBlue.layer.masksToBounds = true
        textBlue.layer.borderColor = UIColor(red: 153.0 / 255.0, green: 50.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0).cgColor
        textBlue.layer.borderWidth = 2.0
        addSubview(textBlue)
        
        textAlpha.returnKeyType = .done
        textAlpha.placeholder = " A"
        textAlpha.layer.cornerRadius = 5.0
        textAlpha.layer.masksToBounds = true
        textAlpha.layer.borderColor = UIColor(red: 153.0 / 255.0, green: 50.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0).cgColor
        textAlpha.layer.borderWidth = 2.0
        addSubview(textAlpha)
        
        textFont.returnKeyType = .done
        textFont.placeholder = " Font"
        textFont.layer.cornerRadius = 5.0
        textFont.layer.masksToBounds = true
        textFont.layer.borderColor = UIColor(red: 153.0 / 255.0, green: 50.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0).cgColor
        textFont.layer.borderWidth = 2.0
        addSubview(textFont)
        
        textSize.returnKeyType = .done
        textSize.placeholder = " Size"
        textSize.layer.cornerRadius = 5.0
        textSize.layer.masksToBounds = true
        textSize.layer.borderColor = UIColor(red: 153.0 / 255.0, green: 50.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0).cgColor
        textSize.layer.borderWidth = 2.0
        addSubview(textSize)
        
        textText.returnKeyType = .done
        textText.placeholder = " Text"
        textText.layer.cornerRadius = 5.0
        textText.layer.masksToBounds = true
        textText.layer.borderColor = UIColor(red: 153.0 / 255.0, green: 50.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0).cgColor
        textText.layer.borderWidth = 2.0
        addSubview(textText)
        
        otherRed.returnKeyType = .done
        otherRed.placeholder = " R"
        otherRed.layer.cornerRadius = 5.0
        otherRed.layer.masksToBounds = true
        otherRed.layer.borderColor = UIColor(red: 153.0 / 255.0, green: 50.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0).cgColor
        otherRed.layer.borderWidth = 2.0
        addSubview(otherRed)
        
        otherBlue.returnKeyType = .done
        otherBlue.placeholder = " B"
        otherBlue.layer.cornerRadius = 5.0
        otherBlue.layer.masksToBounds = true
        otherBlue.layer.borderColor = UIColor(red: 153.0 / 255.0, green: 50.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0).cgColor
        otherBlue.layer.borderWidth = 2.0
        addSubview(otherBlue)
        
        otherGreen.returnKeyType = .done
        otherGreen.placeholder = " G"
        otherGreen.layer.cornerRadius = 5.0
        otherGreen.layer.masksToBounds = true
        otherGreen.layer.borderColor = UIColor(red: 153.0 / 255.0, green: 50.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0).cgColor
        otherGreen.layer.borderWidth = 2.0
        addSubview(otherGreen)
        
        otherAlpha.returnKeyType = .done
        otherAlpha.placeholder = " A"
        otherAlpha.layer.cornerRadius = 5.0
        otherAlpha.layer.masksToBounds = true
        otherAlpha.layer.borderColor = UIColor(red: 153.0 / 255.0, green: 50.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0).cgColor
        otherAlpha.layer.borderWidth = 2.0
        addSubview(otherAlpha)
        
        cornerRadius.returnKeyType = .done
        cornerRadius.placeholder = " Corner Radius"
        cornerRadius.layer.cornerRadius = 5.0
        cornerRadius.layer.masksToBounds = true
        cornerRadius.layer.borderColor = UIColor(red: 153.0 / 255.0, green: 50.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0).cgColor
        cornerRadius.layer.borderWidth = 2.0
        addSubview(cornerRadius)
        
        doneButton.setTitle(NSLocalizedString("Done", comment: ""), for: .normal)
        doneButton.backgroundColor = UIColor(red: 0.0, green: 128.0 / 255.0, blue: 0.0, alpha: 1.0)
        doneButton.layer.cornerRadius = 5.0
        addSubview(doneButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundView.frame = CGRect(x: self.frame.width * 0.1, y: self.frame.height * 0.1, width: self.frame.width * 0.8, height: self.frame.height * 0.8)
        
        title1.frame = CGRect(x: self.frame.width * 0.15, y: self.frame.height * 0.1, width: self.frame.width * 0.5, height: self.frame.height * 0.08)
        
        textRed.frame = CGRect(x: self.frame.width * 0.15, y: self.frame.height * 0.21, width: self.frame.width * 0.13, height: self.frame.height * 0.05)
        
        textGreen.frame = CGRect(x: self.frame.width * 0.33, y: self.frame.height * 0.21, width: self.frame.width * 0.13, height: self.frame.height * 0.05)
        
        textBlue.frame = CGRect(x: self.frame.width * 0.51, y: self.frame.height * 0.21, width: self.frame.width * 0.13, height: self.frame.height * 0.05)
        
        textAlpha.frame = CGRect(x: self.frame.width * 0.69, y: self.frame.height * 0.21, width: self.frame.width * 0.13, height: self.frame.height * 0.05)
        
        textFont.frame = CGRect(x: self.frame.width * 0.15, y: self.frame.height * 0.31, width: self.frame.width * 0.3, height: self.frame.height * 0.05)

        textSize.frame = CGRect(x: self.frame.width * 0.525, y: self.frame.height * 0.31, width: self.frame.width * 0.3, height: self.frame.height * 0.05)
        
        textText.frame = CGRect(x: self.frame.width * 0.15, y: self.frame.height * 0.41, width: self.frame.width * 0.67, height: self.frame.height * 0.05)
        
        otherLabel.frame = CGRect(x: self.frame.width * 0.15, y: self.frame.height * 0.51, width: self.frame.width * 0.5, height: self.frame.height * 0.08)
        
        otherRed.frame = CGRect(x: self.frame.width * 0.15, y: self.frame.height * 0.61, width: self.frame.width * 0.13, height: self.frame.height * 0.05)
        
        otherGreen.frame = CGRect(x: self.frame.width * 0.33, y: self.frame.height * 0.61, width: self.frame.width * 0.13, height: self.frame.height * 0.05)
        
        otherBlue.frame = CGRect(x: self.frame.width * 0.51, y: self.frame.height * 0.61, width: self.frame.width * 0.13, height: self.frame.height * 0.05)
        
        otherAlpha.frame = CGRect(x: self.frame.width * 0.69, y: self.frame.height * 0.61, width: self.frame.width * 0.13, height: self.frame.height * 0.05)
        
        cornerRadius.frame = CGRect(x: self.frame.width * 0.15, y: self.frame.height * 0.71, width: self.frame.width * 0.67, height: self.frame.height * 0.05)
        
        doneButton.frame = CGRect(x: self.frame.width * 0.15, y: self.frame.height * 0.81, width: self.frame.width * 0.67, height: self.frame.height * 0.07)
    }
}
