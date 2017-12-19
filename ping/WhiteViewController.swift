//
//  ViewController.swift
//  ping
//
//  Created by Brenno Ferrari on 19/12/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

import UIKit

class WhiteViewController: UIViewController, CircleTransitionable {

    internal var mainView: UIView {
        return view
    }

    internal var triggerButton: UIButton {
        return blackButton
    }

    @IBOutlet private weak var blackButton: UIButton! {
        didSet {
            blackButton.layer.shadowColor = UIColor.black.cgColor
            blackButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            blackButton.layer.masksToBounds = false
            blackButton.layer.shadowRadius = 1.0
            blackButton.layer.shadowOpacity = 0.5
            blackButton.layer.cornerRadius = blackButton.frame.width / 2
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

