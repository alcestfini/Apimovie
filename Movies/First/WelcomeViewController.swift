//
//  WelcomeViewController.swift
//  Movies
//
//  Created by Seraphina Tatiana   on 09/02/21.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var popupView: PopUpView!
    @IBOutlet weak var movieButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        popupView.setTitleText(title: "Title Pop Up View")
        popupView.setDescriptionText(description: "Description Pop Up View")
    }
    
    @IBAction func seeButton(_ sender: Any) {
        let see = MovieConfigurator.shared.createGenreModule()
                see.modalPresentationStyle = .fullScreen
                self.present(see, animated: true, completion: nil)
    
}
}
