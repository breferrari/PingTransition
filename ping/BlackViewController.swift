//
//  ViewController.swift
//  ping
//
//  Created by Brenno Ferrari on 19/12/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

import UIKit

class BlackViewController: UIViewController, CircleTransitionable {

    internal var mainView: UIView {
        return view
    }

    internal var triggerButton: UIButton {
        return whiteButton
    }

    @IBOutlet private weak var whiteButton: UIButton! {
        didSet {
            whiteButton.layer.shadowColor = UIColor.white.cgColor
            whiteButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            whiteButton.layer.masksToBounds = false
            whiteButton.layer.shadowRadius = 1.0
            whiteButton.layer.shadowOpacity = 0.5
            whiteButton.layer.cornerRadius = whiteButton.frame.width / 2
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTouchUpWhiteButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

