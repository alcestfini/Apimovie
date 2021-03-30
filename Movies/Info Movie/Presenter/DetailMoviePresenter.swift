//
//  GenrePresenter.swift
//  Movies
//
//  Created by Anaidyd Alcestfini on 26/03/21.
//

import Foundation

class DetailMoviePresenter: DetailMovieViewToPresenterProtocol {
    weak var view: DetailMoviePresenterToViewProtocol?
    
    var interactor: DetailMoviePresenterToInteractorProtocol?
    var router: DetailMoviePresenterToRouterProtocol?
    var context: ListMovieViewModel = ListMovieViewModel()
    
    func getDetailMovie() {
        interactor?.fetchDetailMovie(idMovie: context.idMovie)
    }
    
    
}
extension DetailMoviePresenter: DetailMovieInteractorToPresenterProtocol {
    func detailFetched(detailMovie: DetailModel) {
        view?.showDetailMovie(detailModel: detailMovie)
    }
    
    func detailFetchedFailed() {
        view?.showError()
    }
    
}


