//
//  GenreProtocol.swift
//  Movies
//
//  Created by Anaidyd Alcestfini on 26/03/21.
//

import Foundation
import UIKit

protocol GenreViewToPresenterProtocol: class {
    var view: GenrePresenterToViewProtocol? { get set }
    var interactor: GenrePresenterToInteractorProtocol? { get set }
    var router: GenrePresenterToRouterProtocol? { get set }
    
    func getGenre()
    func goToListMovie(context: GenreViewModel)
}
// MARK: - View
protocol GenrePresenterToViewProtocol: class {
    func showGenre(genreModel : GenreModel)
    func showError()
}
// MARK: - Interactor
protocol GenrePresenterToInteractorProtocol: class {
    var presenter: GenreInteractorToPresenterProtocol? { get set }
    var genre: GenreModel? { get }
    
    func fetchGenre()
}
// MARK: - Presenter
protocol GenreInteractorToPresenterProtocol: class {
    func genreFetched(genreModel : GenreModel)
    func genreFetchedFailed()
}
// MARK: - Router
protocol GenrePresenterToRouterProtocol: class {
    func navigateToListGenre(view: GenrePresenterToViewProtocol, context: GenreViewModel) 
}



