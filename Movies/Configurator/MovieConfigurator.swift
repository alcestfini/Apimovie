//
//  MovieConfigurator.swift
//  Movies
//
//  Created by Anaidyd Alcestfini on 29/03/21.
//

import Foundation
import UIKit

public class MovieConfigurator {
    public static var shared = MovieConfigurator()
    
    func createGenreModule() -> UIViewController {
        
        let view = GenreViewController()
        let presenter: GenreViewToPresenterProtocol & GenreInteractorToPresenterProtocol = GenrePresenter()
        let interactor: GenrePresenterToInteractorProtocol = GenreInteractor()
        let router: GenrePresenterToRouterProtocol = GenreRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func createListMovieModule(context: GenreViewModel) -> UIViewController {
        
        let view = MovieViewController()
        let presenter: ListMovieViewToPresenterProtocol & ListMovieInteractorToPresenterProtocol = ListMoviePresenter()
        let interactor: ListMoviePresenterToInteractorProtocol = ListMovieInteractor()
        let router: ListMoviePresenterToRouterProtocol = ListMovieRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        presenter.context = context
        
        return view
    }

    func createDetailModule(context: ListMovieViewModel) -> UIViewController {
        
        let view = DetailMovieViewController()
        let presenter: DetailMovieViewToPresenterProtocol & DetailMovieInteractorToPresenterProtocol = DetailMoviePresenter()
        let interactor: DetailMoviePresenterToInteractorProtocol = DetailMovieInteractor()
        let router: DetailMoviePresenterToRouterProtocol = DetailMovieRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        presenter.context = context

        return view
    }
    
    func createReviewModule(context: ListMovieViewModel) -> UIViewController {

        let view = ReviewMovieViewController()
        let presenter: ReviewMovieViewToPresenterProtocol & ReviewMovieInteractorToPresenterProtocol = ReviewPresenter()
        let interactor: ReviewMoviePresenterToInteractorProtocol = ReviewInteractor()
        let router: ReviewMoviePresenterToRouterProtocol = ReviewRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        presenter.context = context

        return view
    }
    
    func createTrailerModule(context: ListMovieViewModel) -> UIViewController {

        let view = TrailerViewController()
        let presenter: TrailerViewToPresenterProtocol & TrailerInteractorToPresenterProtocol = TrailerPresenter()
        let interactor: TrailerPresenterToInteractorProtocol = TrailerInteractor()
        let router: TrailerPresenterToRouterProtocol = TrailerRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        presenter.context = context

        return view
    }
}
