//
//  UIView+Bordered.swift
//  APOD
//
//  Created by Eduardo Andrade on 1/07/20.
//  Copyright © 2020 Eduardo Andrade. All rights reserved.
//

import UIKit

@IBDesignable
class BorderedView: UIView {

    // MARK: - @IBInspectables
    @IBInspectable var borderWitdh: CGFloat = 1 {
        didSet {
            self.layer.borderWidth = borderWitdh
        }
    }

    @IBInspectable var borderColor: UIColor = .white {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var radius: CGFloat = 10 {
        didSet {
            self.layer.cornerRadius = radius
        }
    }
}
