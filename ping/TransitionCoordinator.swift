//
//  TransitionCoordinator.swift
//  ping
//
//  Created by Brenno Ferrari on 19/12/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

import UIKit

class TransitionCoordinator: NSObject, UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationControllerOperation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        return CircularTransition()

    }

}
