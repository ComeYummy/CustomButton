//
//  CustomButton.swift
//  CustomButton
//
//  Created by Naoki Kameyama on 2020/05/30.
//  Copyright © 2020 Naoki Kameyama. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CustomButton: UIButton {

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



    // グラデーションのlayer
    var gradientLayer = CAGradientLayer()

    // グラデーションの色
    @IBInspectable var gradeintTopColor: UIColor? {
        didSet {
            addGradient()
        }
    }
    @IBInspectable var gradeintBottomColor: UIColor?{
        didSet {
            addGradient()
        }
    }

    override func awakeFromNib() {
        // 角丸の半径をボタン高さの半分にする
        cornerRadius = self.frame.height / 2.0
        // グラデーションを追加
        addGradient()
    }

    // グラデーションを追加する関数
    private func addGradient() {
        // 既にあるlayorを削除
        gradientLayer.removeFromSuperlayer()

        // gradeintTopColor, gradeintBottomColorがオプショナルなので中身を取り出す
        guard let topColor = gradeintTopColor, let bottomColor = gradeintBottomColor else { return }

        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.colors = gradientColors
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        self.layer.insertSublayer(gradientLayer, at: 0)
        self.clipsToBounds = true
    }
}
