//
//  TrailerRouter.swift
//  Movies
//
//  Created by Anaidyd Alcestfini on 29/03/21.
//

import Foundation
import UIKit

class TrailerRouter: TrailerPresenterToRouterProtocol {
    func navigateToListTrailer(view: TrailerPresenterToViewProtocol, context: ListMovieViewModel) {
        if let view = view as? UIViewController {
            let viewController = MovieConfigurator.shared.createTrailerModule(context: context)
            viewController.modalPresentationStyle = .fullScreen
            view.present(viewController, animated: true, completion: nil)

        }
    }
    
    
}
