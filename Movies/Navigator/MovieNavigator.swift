//
//  MovieNavigator.swift
//  Movies
//
//  Created by Anaidyd Alcestfini on 29/03/21.
//

import Foundation
import UIKit

class MovieNavigator: GenrePresenterToRouterProtocol{
    
    // MARK: - Methods
    
    class func createModule() -> UIViewController {
        
        let view = GenreViewController()
        let presenter: GenreViewToPresenterProtocol & GenreInteractorToPresenterProtocol = GenrePresenter()
        let interactor: GenrePresenterToInteractorProtocol = GenreInteractor()
        let router: GenrePresenterToRouterProtocol = GenreRouter()

        view.presenter = presenter
        presenter.view = view
        //presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        return view
    }
    

}

