//
//  DetailMovieViewController.swift
//  Movies
//
//  Created by Seraphina Tatiana   on 10/02/21.
//

import UIKit
import Moya
import Alamofire
import MaterialComponents.MaterialCards

class DetailMovieViewController: BaseViewController {
    
    @IBOutlet weak var releasedateLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var overviewText: UITextView!
    @IBOutlet weak var contentView: MDCCard!
    @IBOutlet weak var reviewButton: UIButton!
    @IBOutlet weak var trailerButton: UIButton!
    
    var detailModel : DetailModel!
    var movie_id : String?
    
    var presenter : DetailMovieViewToPresenterProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getDetailMovie()
        
        //        let loggerConfig = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
        //        let networkLogger = NetworkLoggerPlugin(configuration: loggerConfig)
        //
        //        let provider = MoyaProvider<MovieApi>(plugins: [networkLogger])
        //        provider.request(.detail(movieId: movie_id)) { [self] (result) in
        //            switch result {
        //            case .success(let response):
        //                do{
        //                    let details: DetailModel = try response.map(DetailModel.self)
        //                    self.detailModel = details
        //                    self.releasedateLabel.text = detailModel.releaseDate
        //                    self.overviewText.text = detailModel.overview
        //                    self.statusLabel.text = detailModel.status
        //                    //testttttcommit
        //                }
        //                catch {
        //                    debugPrint("error")
        //                }
        //                break
        //            case .failure(let error):
        //                debugPrint(error)
        //                break
        //            }
        //        }
        
    }
}

extension DetailMovieViewController: DetailMoviePresenterToViewProtocol {
    func showDetailMovie(detailModel: DetailModel) {
        releasedateLabel.text = detailModel.releaseDate
        overviewText.text = detailModel.overview
        statusLabel.text = detailModel.status
    }
    
    
    func showError() {
        print("Error")
    }
    
    @IBAction func backButton(_ sender: Any) { self.dismiss(animated: true, completion: nil)
    }
    @IBAction func reviewButton(_ sender: Any) {
        var context: ListMovieViewModel = ListMovieViewModel()
        context.idMovie = presenter?.context.idMovie ?? ""
        let changePass = MovieConfigurator.shared.createReviewModule(context: context)
        changePass.modalPresentationStyle = .fullScreen
        self.present(changePass, animated: true, completion: nil)
        
    }
    
    @IBAction func trailerButton(_ sender: Any) {
        var context: ListMovieViewModel = ListMovieViewModel()
        context.idMovie = presenter?.context.idMovie ?? ""
        let changePass = MovieConfigurator.shared.createTrailerModule(context: context)
        changePass.modalPresentationStyle = .fullScreen
        self.present(changePass, animated: true, completion: nil)
        
    }
}




