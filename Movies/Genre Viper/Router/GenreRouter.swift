//
//  GenreRouter.swift
//  Movies
//
//  Created by Anaidyd Alcestfini on 26/03/21.
//

import Foundation
import UIKit

class GenreRouter: GenrePresenterToRouterProtocol{
    func navigateToListGenre(view: GenrePresenterToViewProtocol, context: GenreViewModel) {
        if let view = view as? UIViewController {
            let viewController = MovieConfigurator.shared.createListMovieModule(context: context)
            viewController.modalPresentationStyle = .fullScreen
            view.present(viewController, animated: true, completion: nil)
        }
    }
}
