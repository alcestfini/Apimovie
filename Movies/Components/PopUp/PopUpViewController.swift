//
//  PopUpViewController.swift
//  Movies
//
//  Created by Anaidyd Alcestfini on 01/04/21.
//

import UIKit

class PopUpViewController: UIViewController {
    private var popUpView: PopUpView?

    override func viewDidLoad() {
        super.viewDidLoad()

        popUpView = PopUpView(frame: self.view.frame, title: "test", description: "test2")
        self.view.addSubview(popUpView!)
        
        popUpView?.delegate = self

        popUpView?.setTitleText(title: "Title Pop Up View")
        popUpView?.setDescriptionText(description: "Description Pop Up View")
    }
}

extension PopUpViewController: PopUpViewDelegate{
    func tapButton(popUp: PopUpView) {
        debugPrint("Test")
    }
}
