//
//  RDHiddenVisibleButton.swift
//  Radius
//
//  Created by Kassandra Capretta on 11/17/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit

class RDHiddenVisibleButton: UIButton {
        
        // Hidden / Visible Button Function
        var isOn = false
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            initButton()
        }
    
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            initButton()
        }
        
        func initButton() {
            layer.borderWidth = 2.0
            layer.borderColor = Colors.radiusGreen.cgColor
            layer.cornerRadius = frame.size.height/2
            
            setTitleColor(Colors.radiusGreen, for: .normal)
            addTarget(self, action: #selector(RDHiddenVisibleButton.buttonPressed), for: .touchUpInside)
            
        }
        
    @objc func buttonPressed() {
            activateButton(bool: !isOn)
        }
        
        func activateButton(bool: Bool) {
            
            isOn = bool
            
            let color = bool ? Colors.radiusGreen : .clear
            let title = bool ? "Hidden" : "Visible"
            let titleColor = bool ? . white : Colors.radiusGreen
            
            setTitle(title, for: .normal)
            setTitleColor(titleColor, for: .normal)
            backgroundColor = color
        }
    }


