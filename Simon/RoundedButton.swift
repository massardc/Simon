//
//  RoundedButton.swift
//  Simon
//
//  Created by ClementM on 02/03/2018.
//  Copyright © 2018 ClementM. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    override func awakeFromNib() {
        layer.cornerRadius = frame.size.width / 2
        layer.masksToBounds = true
    }

}
