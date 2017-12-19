//
//  PingNavigationController.swift
//  ping
//
//  Created by Brenno Ferrari on 19/12/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

import UIKit

class PingNavigationController: UINavigationController {

    let transitionCoordinatorDelegate = TransitionCoordinator()

    override func viewDidLoad() {
        isNavigationBarHidden = true
        delegate = transitionCoordinatorDelegate
    }

}
