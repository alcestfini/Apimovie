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
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var detailView: UIView!
    
    var detailModel : DetailModel?
    var movie_id : String?
    var presenter : DetailMovieViewToPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getDetailMovie()
    }
}
extension DetailMovieViewController: DetailMoviePresenterToViewProtocol {
    func showDetailMovie(detailModel: DetailModel) {
        self.emptyView.isHidden = true
        self.detailView.isHidden = false
        releasedateLabel.text = detailModel.releaseDate
        overviewText.text = detailModel.overview
        statusLabel.text = detailModel.status
    }
    func showError() {
        self.emptyView.isHidden = false
        self.detailView.isHidden = true
    }
    @IBAction func backButton(_ sender: Any) { self.dismiss(animated: true, completion: nil)
    }
    @IBAction func reviewButton(_ sender: Any) {
        var context: ListMovieViewModel = ListMovieViewModel()
        context.idMovie = presenter?.context.idMovie ?? ""
        presenter?.goToListReview(context: context)
    }
    @IBAction func trailerButton(_ sender: Any) {
        var context: ListMovieViewModel = ListMovieViewModel()
        context.idMovie = presenter?.context.idMovie ?? ""
       presenter?.goToTrailer(context: context)
    }
}




