//
//  ViewController.swift
//  AlertMenu
//
//  Created by Dmitriy Polyakov on 10/15/2020.
//  Copyright (c) 2020 Dmitriy Polyakov. All rights reserved.
//

import UIKit
import AlertMenu

class ViewController: UIViewController, AlertMenuPresentable {
    
    private let exampleBt = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.exampleBt)
        self.exampleBt.translatesAutoresizingMaskIntoConstraints = false
        self.exampleBt.setTitle("Example", for: .normal)
        self.exampleBt.addTarget(self, action: #selector(self.tapBt), for: .touchUpInside)
        NSLayoutConstraint.activate([
            self.exampleBt.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.exampleBt.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    @objc private func tapBt() {
        self.showAlertMenu(.okAlert(title: "This is OK alert", message: "Yes, this is OK alert", handler: { [weak self] in
            AlertMenuLocalization.customBundle = Bundle.main
            self?.showAlertMenu(.confirmAlert(title: "This is CONFIRM alert", message: "With custom Bundle", handler: { [weak self] in
                AlertMenuLocalization.Proceed = "Proceed custom localize"
                self?.showAlertMenu(.proceedAlert(title: "This is CONFIRM alert", message: "With custom string"))
            }))
        }))
    }

}

