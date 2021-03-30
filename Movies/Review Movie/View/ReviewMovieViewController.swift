//
//  ReviewMovieViewController.swift
//  Movies
//
//  Created by Seraphina Tatiana   on 10/02/21.
//

import UIKit
import Alamofire
import Moya

class ReviewMovieViewController: BaseViewController {
    
    @IBOutlet weak var listReview: UITableView!
    var reviewModel : ReviewModel!
    var review       : String!
    var movie_id : String!
    var presenter : ReviewMovieViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listReview.delegate = self
        listReview.dataSource = self
     
        let nibClass = UINib(nibName: "ReviewMovieTableViewCell", bundle: nil)
        listReview.register(nibClass, forCellReuseIdentifier: "reviewIdentifier")
        presenter?.getReviewMovie()
        
//        let loggerConfig = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
//        let networkLogger = NetworkLoggerPlugin(configuration: loggerConfig)
//        let provider = MoyaProvider<MovieApi>(plugins: [networkLogger])
//        provider.request(.review(movieId: movie_id)) { [self] (result) in
//            switch result {
//            case .success(let response):
//                do{
//                    let reviews: ReviewModel = try response.map(ReviewModel.self)
//                    self.reviewModel = reviews
//                    self.listReview.reloadData()
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
    
   
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
        
    }
}
extension ReviewMovieViewController: ReviewMoviePresenterToViewProtocol {
    func showError() {
        debugPrint("Error")
    }
    
    func showReviewMovie(reviewModel: ReviewModel) {
        self.reviewModel = reviewModel
        listReview.reloadData()
    
    }
}
extension ReviewMovieViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewModel?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listReview.dequeueReusableCell(withIdentifier: "reviewIdentifier") as! ReviewMovieTableViewCell
        
        let reviewsModel: Results = (reviewModel?.results[indexPath.row])!
        cell.authorLabel.text = reviewsModel.authorDetails.username
        cell.createdLabel.text = reviewsModel.createdAt
        cell.reviewText.text = reviewsModel.content
        
        return cell
    }
}
