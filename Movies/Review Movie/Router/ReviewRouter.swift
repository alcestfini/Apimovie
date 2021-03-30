//
//  ReviewRouter.swift
//  Movies
//
//  Created by Anaidyd Alcestfini on 29/03/21.
//

import Foundation
import UIKit

class ReviewRouter: ReviewMoviePresenterToRouterProtocol{
    func navigateToListReview(view: ReviewMoviePresenterToViewProtocol) {
        if let view = view as? UIViewController {
            //let viewController = MovieConfigurator.shared.createListMovieModule()
        }
    }

}

