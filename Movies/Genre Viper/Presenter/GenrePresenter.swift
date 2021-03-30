//
//  GenrePresenter.swift
//  Movies
//
//  Created by Anaidyd Alcestfini on 26/03/21.
//

import Foundation

class GenrePresenter: GenreViewToPresenterProtocol {
  
    
    var router: GenrePresenterToRouterProtocol?
    var view: GenrePresenterToViewProtocol?
    var interactor: GenrePresenterToInteractorProtocol?
    func getGenre()  {
        interactor?.fetchGenre()
    }
    func goToListMovie(context: GenreViewModel) {
        guard  let view = view else { return }
        router?.navigateToListGenre(view: view, context: context)
    }
    
    
}
extension GenrePresenter: GenreInteractorToPresenterProtocol {
    func genreFetchedFailed() {
        view?.showError()
    }
    
    func genreFetched(genreModel: GenreModel) {
        view?.showGenre(genreModel: genreModel)
    }
    
    
    
    
}
