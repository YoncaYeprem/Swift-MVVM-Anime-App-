//
//  UIViewExtension.swift
//  animeapp
//
//  Created by YONCA YEPREM on 17.09.2022.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}

