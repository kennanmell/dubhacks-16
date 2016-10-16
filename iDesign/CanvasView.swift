//
//  CanvasView.swift
//  iDesign
//
//  Created by Kennan Mell on 10/15/16.
//  Copyright © 2016 Kennan Mell. All rights reserved.
//

import UIKit

class CanvasView: UIView {
    let defaultLabel = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        defaultLabel.textColor = UIColor(white: 0.65, alpha: 1.0)
        defaultLabel.text = "Double-tap to add a new UX element!"
        defaultLabel.font = UIFont(name: defaultLabel.font.fontName, size: 20)
        defaultLabel.numberOfLines = 0
        defaultLabel.textAlignment = .center
        addSubview(defaultLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        defaultLabel.frame = CGRect(x: 10, y: self.frame.height * 0.4, width: self.frame.width - 20, height: self.frame.height * 0.2)
    }
}
