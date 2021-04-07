//
//  ListMovieProtocol.swift
//  Movies
//
//  Created by Anaidyd Alcestfini on 26/03/21.
//

import Foundation
import UIKit

protocol DetailMovieViewToPresenterProtocol: class {
    var view: DetailMoviePresenterToViewProtocol? { get set }
    var interactor: DetailMoviePresenterToInteractorProtocol? { get set }
    var router: DetailMoviePresenterToRouterProtocol? { get set }
    var context: ListMovieViewModel { get set }

    func getDetailMovie()
    func goToListReview(context: ListMovieViewModel)
    func goToTrailer(context: ListMovieViewModel)
}

//MARK: -View
protocol DetailMoviePresenterToViewProtocol: class {
    func showDetailMovie(detailModel : DetailModel)
    func showError()
}

//MARK: -Interactor
protocol DetailMoviePresenterToInteractorProtocol: class {
    var presenter: DetailMovieInteractorToPresenterProtocol? { get set }
    var detail: DetailModel? { get }
    
    func fetchDetailMovie(idMovie: String)
}

//MARK: -Presenter
protocol DetailMovieInteractorToPresenterProtocol: class {
    func detailFetched(detailMovie : DetailModel)
    func detailFetchedFailed()
}

//MARK: -Router
protocol DetailMoviePresenterToRouterProtocol: class {
    func navigateToDetailMovie(view: DetailMoviePresenterToViewProtocol, context: ListMovieViewModel)
    
    func navigateToTrailerMovie(view: DetailMoviePresenterToViewProtocol, context: ListMovieViewModel)
    
}

