//
//  GenrePresenter.swift
//  Movies
//
//  Created by Anaidyd Alcestfini on 26/03/21.
//

import Foundation

class ListMoviePresenter: ListMovieViewToPresenterProtocol {
    weak var view: ListMoviePresenterToViewProtocol?
    
    var interactor: ListMoviePresenterToInteractorProtocol?
    var router: ListMoviePresenterToRouterProtocol?
    var context: GenreViewModel = GenreViewModel()
    
    func getListMovie()  {
        interactor?.fetchMovie(idGenre: context.idGenre)
    }
    
    
}
extension ListMoviePresenter: ListMovieInteractorToPresenterProtocol {
    func movieFetchedFailed() {
        view?.showError()
    }
    
    func movieFetched(movieModel: MovieModel) {
        view?.showListMovie(movieModel: movieModel)
    }
    
    
}

