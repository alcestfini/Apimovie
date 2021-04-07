import UIKit
import Alamofire
import Moya

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    // -Moya 
    
    func getRequest(tag: String) {
        let provider = MoyaProvider<MovieApi>()
        provider.request(.genre(apikey: "API_KEY")) { (result) in
            switch result {
            case .success(let response):
                print(response.statusCode)
            //self.onSuccess(data: data, tag: tag)
            case .failure(let error):
                // self.onFailed(tag: tag)
                print(error.errorDescription ?? "")
                
            }
        }
    }
    
    func postRequest(url: String, parameters: [String:Any], tag: String){
        
        AF.request("\(MoviesUrl.BASE_URL)\(url)",
                   method: .post,
                   parameters: parameters,
                   encoding: URLEncoding.httpBody).responseData { response in
                    debugPrint(response)
                    switch response.result {
                    case .success(let data):
                        self.onSuccess(data: data, tag: tag)
                        break
                    case .failure(_):
                        self.onFailed(tag: tag)
                        break
                    }
                   }
    }
    
    func putRequest(url: String, parameters: [String:Any], tag: String){
        
        AF.request("\(MoviesUrl.BASE_URL)\(url)",
                   method: .put,
                   parameters: parameters,
                   encoding: URLEncoding.httpBody).responseData { response in
                    
                    switch response.result {
                    case .success(let data):
                        self.onSuccess(data: data, tag: tag)
                        break
                    case .failure(_):
                        self.onFailed(tag: tag)
                        break
                    }
                   }
    }
    
    
    func onSuccess(data: Data, tag: String){}
    
    func onFailed(tag: String){
        debugPrint("Error Get Request \(tag)")
    }
    
}

var loadingView : UIView?

extension UIViewController {
    
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        loadingView = spinnerView
    }

    func removeSpinner() {
        DispatchQueue.main.async {
            loadingView?.removeFromSuperview()
            loadingView = nil
        }
    }
}
