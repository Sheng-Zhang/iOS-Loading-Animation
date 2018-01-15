//
//  ViewController.swift
//  SBLoader
//
//  Created by Satraj Bambra on 2015-03-16.
//  Copyright (c) 2015 Satraj Bambra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, HolderViewDelegate {
  
    var holderView = HolderView(frame: CGRect.zero)
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }
  
  
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addHolderView()
    }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  
    func addHolderView() {
        let boxSize: CGFloat = 100.0
    
        holderView.frame = CGRect(x: view.bounds.width / 2 - boxSize / 2,
                              y: view.bounds.height / 2 - boxSize / 2,
                              width: boxSize,
                              height: boxSize)
        holderView.parentFrame = view.frame
        holderView.delegate = self
        
        view.addSubview(holderView)
        holderView.addOval()  
    }
  
  
    func animateLabel() {
        // 1
        holderView.removeFromSuperview()
        view.backgroundColor = Colors.green
        
        // 2
        let label = UILabel(frame: view.frame)
        label.textColor = Colors.white
        label.font = UIFont(name: "HelveticaNeue-Thin", size: 40.0)
        label.textAlignment = .center
        label.text = "MyBaker"
        label.transform = CGAffineTransform.init(scaleX: 0.25, y: 0.25)
        view.addSubview(label)
        
        // 3
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
            label.transform = CGAffineTransform.init(scaleX: 1.6, y: 1.6)
        }, completion: { isCompleted in
            self.addButton()
        })
    }
  
  
    func addButton() {
        let button = UIButton()
        button.frame = CGRect.init(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
    
        button.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        
        view.addSubview(button)
    }
  
    @objc func buttonPressed(sender: UIButton!) {
        view.backgroundColor = Colors.white
        view.subviews.map({ $0.removeFromSuperview() })
        
        holderView = HolderView(frame: CGRect.zero)
        
        addHolderView()
    }
}

