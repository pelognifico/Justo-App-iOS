//
//  HomeViewController.swift
//  Justo App
//
//  Created by Carlos Villamizar on 6/8/21.
//

import UIKit
import MaterialComponents.MaterialTextControls_FilledTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import Kingfisher

protocol HomeDisplayLogic: AnyObject {
    func displayHome(viewModel: Home.Profile.ViewModel, on queu: DispatchQueue)
    func displayError(viewModel: Home.Error.ViewModel, on queu: DispatchQueue)
}

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var pictureImageView: JAImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var emailTextField: MDCFilledTextField!
    @IBOutlet weak var passwordTextField: MDCFilledTextField!
    @IBOutlet weak var phoneTextField: MDCFilledTextField!
    @IBOutlet weak var cityTextField: MDCFilledTextField!
    @IBOutlet weak var countryTextField: MDCFilledTextField!
    @IBOutlet weak var versionLabel: UILabel!
    
    
    var interactor: HomeBusinessLogic?
    var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?
    
    // MARK: - Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        let viewController = self
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.clearBackground()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        settingsUI()
        
        let request = Home.Profile.Request()
        interactor?.profile(request: request)
    }
    
    // MARK: - Methods
    func settingsUI() {
        
        emailTextField.label.text   = "Email"
        emailTextField.placeholder  = "Enter your email"
        emailTextField.sizeToFit()
        emailTextField.setFilledBackgroundColor(.clear, for: .normal)
        
        passwordTextField.label.text   = "Password"
        passwordTextField.placeholder  = "Enter your password"
        passwordTextField.sizeToFit()
        passwordTextField.setFilledBackgroundColor(.clear, for: .normal)
        
        
        phoneTextField.label.text   = "Phone"
        phoneTextField.placeholder  = "Enter your phone"
        phoneTextField.sizeToFit()
        phoneTextField.setFilledBackgroundColor(.clear, for: .normal)
        
        cityTextField.label.text   = "City"
        cityTextField.placeholder  = "Enter your city/state"
        cityTextField.sizeToFit()
        cityTextField.setFilledBackgroundColor(.clear, for: .normal)
        
        countryTextField.label.text   = "Country"
        countryTextField.placeholder  = "Enter your country"
        countryTextField.sizeToFit()
        countryTextField.setFilledBackgroundColor(.clear, for: .normal)
        
    }
    
    // SetUp image from url
    func setImage(_ urlString: String?) {
        guard let urlString = urlString, !urlString.isEmpty, let imageURL = URL(string: urlString) else { return }
        
        let processor = DownsamplingImageProcessor(size: pictureImageView.bounds.size)
        pictureImageView.kf.indicatorType = .activity
        pictureImageView.kf.setImage(with: imageURL,
                                options: [
                                    .processor(processor),
                                    .scaleFactor(UIScreen.main.scale),
                                    .transition(.fade(1)),
                                ],
                                completionHandler: { result in
            switch result {
            case .success:
                break
            case .failure:
                break
            }
        })
    }

}

// MARK: - HomeDisplayLogic
extension HomeViewController: HomeDisplayLogic {
    // Show and filter view posts
    func displayHome(viewModel: Home.Profile.ViewModel, on queu: DispatchQueue = .main) {
        let user = viewModel.results
        let info = viewModel.info
        
        setImage(user.picture.large)
        nameLabel.text = user.name.first
        ageLabel.text = String("Age \(user.dob.age ?? 0)")
        passwordTextField.text = user.login.password
        phoneTextField.text = user.cell
        cityTextField.text = user.location.city
        countryTextField.text = user.location.country
        emailTextField.text = user.email
        versionLabel.text = String("v\(info.version)")
    }
    
    // Show an simple alert error
    func displayError(viewModel: Home.Error.ViewModel, on queu: DispatchQueue = .main) {
        displaySimpleAlert(with: "Error", message: viewModel.error.description)
    }
    
}
