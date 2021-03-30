//
//  GenrePresenter.swift
//  Movies
//
//  Created by Anaidyd Alcestfini on 26/03/21.
//

import Foundation

class ListMoviePresenter: ListMovieViewToPresenterProtocol {

    var view: ListMoviePresenterToViewProtocol?
    
    var interactor: ListMoviePresenterToInteractorProtocol?
    var router: ListMoviePresenterToRouterProtocol?
    var context: GenreViewModel = GenreViewModel()
    
    
    func goToDetailMovie(context: ListMovieViewModel) {
        guard let view = view else { return }
        router?.navigateToListMovie(view: view, context: context)
    }
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

