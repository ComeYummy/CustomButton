//
//  CustomImageView.swift
//  CustomButton
//
//  Created by Naoki Kameyama on 2020/05/30.
//  Copyright © 2020 Naoki Kameyama. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CustomImageView: UIImageView {

    // 角の半径の初期値
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }

    // 枠線の色
    @IBInspectable var borderColor: UIColor? {
        didSet {
            self.layer.borderColor = borderColor?.cgColor
        }
    }

    // 枠線の太さ
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
}
