//
//  Created by Tom Baranes on 23/08/16.
//  Copyright (c) 2016 IBAnimatable. All rights reserved.
//

import UIKit

public class ActivityIndicatorAnimationLineScaleParty: ActivityIndicatorAnimating {

  // MARK: Properties

  private let timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)

  // MARK: ActivityIndicatorAnimating

  public func configAnimation(in layer: CALayer, size: CGSize, color: UIColor) {
    let lineSize = size.width / 7
    let x = (layer.bounds.size.width - size.width) / 2
    let y = (layer.bounds.size.height - size.height) / 2
    let durations: [CFTimeInterval] = [1.26, 0.43, 1.01, 0.73]
    let beginTime = CACurrentMediaTime()
    let beginTimes: [CFTimeInterval] = [0.77, 0.29, 0.28, 0.74]

    // Animation
    let animation = self.animation
    for i in 0..<4 {
      let line = ActivityIndicatorShape.Line.createLayerWith(size: CGSize(width: lineSize, height: size.height), color: color)
      let frame = CGRect(x: x + lineSize * 2 * CGFloat(i), y: y, width: lineSize, height: size.height)
      animation.beginTime = beginTime + beginTimes[i]
      animation.duration = durations[i]
      line.frame = frame
      line.addAnimation(animation, forKey: "animation")
      layer.addSublayer(line)
    }
  }
}

// MARK: - Setup

private extension ActivityIndicatorAnimationLineScaleParty {

  var animation: CAKeyframeAnimation {
    let animation = CAKeyframeAnimation(keyPath:"transform.scale")
    animation.keyTimes = [0, 0.5, 1]
    animation.timingFunctions = [timingFunction, timingFunction]
    animation.values = [1, 0.5, 1]
    animation.repeatCount = .infinity
    animation.removedOnCompletion = false
    return animation
  }

}
