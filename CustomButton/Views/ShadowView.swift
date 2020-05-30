//
//  ShadowView.swift
//  CustomButton
//
//  Created by Naoki Kameyama on 2020/05/31.
//  Copyright © 2020 Naoki Kameyama. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class ShadowView: UIView {
    
    // 影の方向（width=右方向、height=下方向）
    @IBInspectable var shadowOffset: CGSize = CGSize.zero {
        didSet {
            self.layer.shadowOffset = shadowOffset
            addDropShadow()
        }
    }

    override func awakeFromNib() {
        // ドロップシャドウを追加
        addDropShadow()
        self.layer.cornerRadius = 10
    }

    private func addDropShadow() {
        // shadowViewの生成
        let shadowView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        shadowView.backgroundColor = .lightGray
        // 影の方向（width=右方向、height=下方向）
        shadowView.layer.shadowOffset = CGSize.zero
        // 影の色
        shadowView.layer.shadowColor = UIColor.black.cgColor
        // 影の濃さ
        shadowView.layer.shadowOpacity = 0.6
        // 影をぼかし
        shadowView.layer.shadowRadius = 10
        self.addSubview(shadowView)
        //        self.clipsToBounds = true
    }
}
