//
//  PopUpView.swift
//  Movies
//
//  Created by Anaidyd Alcestfini on 19/03/21.
//

import UIKit
public protocol PopUpViewDelegate: class {
    func tapButton(popUp: PopUpView)
    
}

public struct PopUpViewDepedency {
    let titlePopUp: String?
    let description: String?
    let button: String?
    
    public init (title: String? = nil, description: String? = nil, button: String? = nil) {
        self.titlePopUp = title
        self.description = description
        self.button = button
    
    
    }
    
    
}
public class PopUpView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet var backgroundView: PopUpView!
    @IBOutlet weak var pushButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    
    public weak var delegate: PopUpViewDelegate?
    private static let nibName = String(describing: PopUpView.self)
    @IBAction func pushButtonTap(_ sender: Any) {
        delegate?.tapButton(popUp: self)
        
    }
    override init(frame: CGRect){
        super.init(frame: frame)
        initSubView()
        setUpContentView()
    }
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubView()
        setUpContentView()
    }
    public init(frame: CGRect, title: String, description: String) {
        super.init(frame: frame)
        initSubView()
        setUpContentView()
        setTitleText(title: title)
        setDescriptionText(description: description)
    }
    
    
    public func setTitleText(title: String) {
        titleLabel.text = title
    }
    public func setDescriptionText(description: String) {
        descLabel.text = description
    }
    public func setButtonText(button: String) {
        pushButton.setTitle(button, for: .normal)
    }
    func initSubView() {
        let bundle = Bundle(for: PopUpView.self)
        bundle.loadNibNamed(PopUpView.nibName, owner: self, options: nil)
        self.addSubview(backgroundView)
        backgroundView.frame = self.bounds
        backgroundView.autoresizingMask = [ .flexibleHeight,.flexibleWidth ]

    }
    func setUpContentView() {
//        contentView.layer.masksToBounds = true
    }
    
}
