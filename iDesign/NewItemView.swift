//
//  NewItemView.swift
//  iDesign
//
//  Created by Kennan Mell on 10/15/16.
//  Copyright © 2016 Kennan Mell. All rights reserved.
//

import UIKit

class NewItemView: UIView {
    let advancedNewView = AdvancedNewView()
    let shareButton = UIButton()
    let cancelButton = UIButton()
    let createButton = UIButton()
    let widthField = UITextField()
    let heightField = UITextField()
    let nameTextField = UITextField()
    let classTextField = UITextField()
    let pickImageButton = UIButton()
    let titleLabel = UILabel()
    let advancedButton = UIButton()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        cancelButton.setTitle("Cancel", for: .normal)
        self.addSubview(cancelButton)
        cancelButton.titleLabel?.textAlignment = .center
        cancelButton.setTitleColor(UIColor(red: 51.0 / 255.0, green: 116.0 / 255.0, blue: 1.0, alpha: 1.0), for: .normal)
        cancelButton.setTitleColor(UIColor(red: 51.0 / 255.0, green: 178.0 / 255.0, blue: 1.0, alpha: 1.0), for: .highlighted)
        cancelButton.isUserInteractionEnabled = true
        
        addSubview(shareButton)
        shareButton.setImage(UIImage(named: "ShareButton"), for: .normal)
        
        createButton.setTitle(NSLocalizedString("Create", comment: ""), for: .normal)
        createButton.backgroundColor = UIColor(red: 0.0, green: 128.0 / 255.0, blue: 0.0, alpha: 1.0)
        createButton.layer.cornerRadius = 5.0
        
        pickImageButton.setTitle(NSLocalizedString("Placeholder Image", comment: ""), for: .normal)
        pickImageButton.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 128.0 / 255.0, alpha: 1.0)
        pickImageButton.layer.cornerRadius = 5.0
        
        advancedButton.setTitle(NSLocalizedString("Advanced", comment: ""), for: .normal)
        advancedButton.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 128.0 / 255.0, alpha: 1.0)
        advancedButton.layer.cornerRadius = 5.0
        
        titleLabel.text = "New Element"
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 23)
        
        addSubview(advancedNewView)
        addSubview(advancedButton)
        advancedNewView.isHidden = true

        addSubview(titleLabel)
        addSubview(createButton)
        addSubview(widthField)
        addSubview(heightField)
        addSubview(nameTextField)
        addSubview(classTextField)
        addSubview(pickImageButton)
        
        widthField.returnKeyType = .done
        widthField.placeholder = " Width %"
        widthField.layer.cornerRadius = 5.0
        widthField.layer.masksToBounds = true
        widthField.layer.borderColor = UIColor(red: 153.0 / 255.0, green: 50.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0).cgColor
        widthField.layer.borderWidth = 2.0
        
        heightField.returnKeyType = .done
        heightField.placeholder = " Height %"
        heightField.layer.cornerRadius = 5.0
        heightField.layer.masksToBounds = true
        heightField.layer.borderColor = UIColor(red: 153.0 / 255.0, green: 50.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0).cgColor
        heightField.layer.borderWidth = 2.0
        
        nameTextField.returnKeyType = .done
        nameTextField.placeholder = " Instance Name"
        nameTextField.layer.cornerRadius = 5.0
        nameTextField.layer.masksToBounds = true
        nameTextField.layer.borderColor = UIColor(red: 165.0 / 255.0, green: 42.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0).cgColor
        nameTextField.layer.borderWidth = 2.0
        
        classTextField.returnKeyType = .done
        classTextField.placeholder = " Class Name"
        classTextField.layer.cornerRadius = 5.0
        classTextField.layer.masksToBounds = true
        classTextField.layer.borderColor = UIColor(red: 165.0 / 255.0, green: 42.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0).cgColor
        classTextField.layer.borderWidth = 2.0
        
        bringSubview(toFront: advancedNewView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        advancedNewView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        titleLabel.frame = CGRect(x: self.frame.width * 0.1, y: self.frame.height * 0.022, width: self.frame.width * 0.7, height: self.frame.height * 0.12)
        cancelButton.frame = CGRect(x: self.frame.width * 0.75, y: self.frame.height * 0.035, width: self.frame.width * 0.2, height: self.frame.height * 0.1)
        widthField.frame = CGRect(x: self.frame.width * 0.1, y: self.frame.height * 0.17, width: self.frame.width * 0.35, height: self.frame.width * 0.1)
        heightField.frame = CGRect(x: self.frame.width * 0.55, y: self.frame.height * 0.17, width: self.frame.width * 0.35, height: self.frame.width * 0.1)
        pickImageButton.frame = CGRect(x: self.frame.width * 0.1, y: self.frame.height * 0.37, width: self.frame.width * 0.8, height: self.frame.height * 0.08)
        advancedButton.frame = CGRect(x: self.frame.width * 0.1, y: self.frame.height * 0.27, width: self.frame.width * 0.8, height: self.frame.height * 0.08)
        nameTextField.frame = CGRect(x: self.frame.width * 0.1, y: self.frame.height * 0.49, width: self.frame.width * 0.8, height: self.frame.width * 0.1)
        classTextField.frame = CGRect(x: self.frame.width * 0.1, y: self.frame.height * 0.59, width: self.frame.width * 0.8, height: self.frame.width * 0.1)
        createButton.frame = CGRect(x: self.frame.width * 0.1, y: self.frame.height * 0.75, width: self.frame.width * 0.8, height: self.frame.height * 0.15)
        shareButton.frame = CGRect(x: self.frame.width - 50, y: self.frame.height - 60, width: 38, height: 53)
    }
}
