//
//  CircularTransition.swift
//  ping
//
//  Created by Brenno Ferrari on 19/12/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

import UIKit

protocol CircleTransitionable {
    var triggerButton: UIButton { get }
    var mainView: UIView { get }
}

class CircularTransition: NSObject, UIViewControllerAnimatedTransitioning {

    fileprivate weak var context: UIViewControllerContextTransitioning?

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        guard let fromViewController = transitionContext.viewController(forKey: .from) as? CircleTransitionable,
              let toViewController = transitionContext.viewController(forKey: .to) as? CircleTransitionable,
              let snapshot = fromViewController.mainView.snapshotView(afterScreenUpdates: false)
        else {
            transitionContext.completeTransition(false)
            return
        }

        context = transitionContext

        let backgroundView = UIView()
        backgroundView.frame = toViewController.mainView.frame
        backgroundView.backgroundColor = fromViewController.mainView.backgroundColor

        let containerView = transitionContext.containerView
        containerView.addSubview(backgroundView)
        containerView.addSubview(snapshot)

        fromViewController.mainView.removeFromSuperview()

        animateOffscreen(fromView: snapshot)

        containerView.addSubview(toViewController.mainView)
        animate(toView: toViewController.mainView, fromTriggerButton: fromViewController.triggerButton)
    }

    private func animateOffscreen(fromView: UIView) {

        // 1
        UIView.animate(withDuration: 0.25,
                       delay: 0.0,
                       options: [.curveEaseIn],
                       animations: {
                        // 2
                        fromView.center = CGPoint(x: fromView.center.x - 1300,
                                                  y: fromView.center.y + 1500)
                        // 3
                        fromView.transform = CGAffineTransform(scaleX: 5.0, y: 5.0)
        }, completion: nil)

    }

    private func animate(toView: UIView, fromTriggerButton triggerButton: UIButton) {

        // 1
        let rect = CGRect(x: triggerButton.frame.origin.x,
                          y: triggerButton.frame.origin.y,
                          width: triggerButton.frame.width,
                          height: triggerButton.frame.width)
        // 2
        let circleMaskPathInitial = UIBezierPath(ovalIn: rect)

        // 1
        let fullHeight = toView.bounds.height
        let extremePoint = CGPoint(x: triggerButton.center.x,
                                   y: triggerButton.center.y - fullHeight)
        // 2
        let radius = sqrt((extremePoint.x*extremePoint.x) +
            (extremePoint.y*extremePoint.y))
        // 3
        let circleMaskPathFinal = UIBezierPath(ovalIn: triggerButton.frame.insetBy(dx: -radius,
                                                                                   dy: -radius))

        let maskLayer = CAShapeLayer()
        maskLayer.path = circleMaskPathFinal.cgPath
        toView.layer.mask = maskLayer

        let maskLayerAnimation = CABasicAnimation(keyPath: "path")
        maskLayerAnimation.fromValue = circleMaskPathInitial.cgPath
        maskLayerAnimation.toValue = circleMaskPathFinal.cgPath
        maskLayerAnimation.duration = 0.15
        maskLayerAnimation.delegate = self

        maskLayer.add(maskLayerAnimation, forKey: "path")

    }

}

extension CircularTransition: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        context?.completeTransition(true)
    }
}
