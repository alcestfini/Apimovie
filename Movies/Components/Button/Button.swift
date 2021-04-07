//
//  Button.swift
//  Movies
//
//  Created by Anaidyd Alcestfini on 01/04/21.
//

import UIKit

public protocol ButtonViewDelegate: class {
    func tapButton(buttonView: Button)
}

public struct ButtonViewDepedency {
    let button: String?

    public init (button: String? = nil) {
        self.button = button
    }
}

public class Button: UIView {

    @IBOutlet weak var buttonView: UIButton!

    public weak var delegate: ButtonViewDelegate?
    private static let nibName = String(describing: Button.self)
    @IBAction func pushButtonTap(_ sender: Any) {
        delegate?.tapButton(buttonView: self)
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
    }
    public func setButtonText(button: String) {
        buttonView.setTitle(button, for: .normal)
    }
    func initSubView() {
//        let bundle = Bundle(for: buttonView.self)
//        bundle.loadNibNamed(buttonView.nibName, owner: self, options: nil)
//        self.addSubview(contentView)
//        contentView.frame = self.bounds
//        contentView.autoresizingMask = [ .flexibleHeight,.flexibleWidth ]
//                let nib = UINib(nibName: PopUpView.nibName, bundle: bundle)
//                nib.instantiate(withOwner: self, options: nil)
//                contentView.frame = bounds
//                addSubview(contentView)
    }
    func setUpContentView() {
//        contentView.layer.masksToBounds = true
    }
}

