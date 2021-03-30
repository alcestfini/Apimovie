//
//  ListMovieProtocol.swift
//  Movies
//
//  Created by Anaidyd Alcestfini on 26/03/21.
//

import Foundation
import UIKit

protocol ListMovieViewToPresenterProtocol: class {
    var view: ListMoviePresenterToViewProtocol? { get set }
    var interactor: ListMoviePresenterToInteractorProtocol? { get set }
    var router: ListMoviePresenterToRouterProtocol? { get set }
    var context: GenreViewModel { get set }
    
    func getListMovie()
    func goToDetailMovie(context: ListMovieViewModel)
}

//MARK: -View
protocol ListMoviePresenterToViewProtocol: class {
    func showListMovie(movieModel : MovieModel)
    func showError()
}

//MARK: -Interactor
protocol ListMoviePresenterToInteractorProtocol: class {
    var presenter: ListMovieInteractorToPresenterProtocol? { get set }
    var movie: MovieModel? { get }
    
    func fetchMovie(idGenre: String)
}

//MARK: -Presenter
protocol ListMovieInteractorToPresenterProtocol: class {
    func movieFetched(movieModel : MovieModel)
    func movieFetchedFailed()
}

//MARK: -Router
protocol ListMoviePresenterToRouterProtocol: class {
    func navigateToListMovie(view: ListMoviePresenterToViewProtocol, context: ListMovieViewModel)
}

