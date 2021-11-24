//
//  HomeViewController.swift
//  Nao Track Appx
//
//  Created by Pole Star on 23/11/2021.
//

import UIKit


class HomeViewController: UIViewController {

    // Mark - Properties
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
//        imageView.layer.borderWidth = 3
//        imageView.layer.borderColor = UIColor.borderBluePolestar.cgColor
        return imageView
    }()
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        view.addSubview(logoImageView)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.anchor(top: view.topAnchor, paddingTop: 88, width: 128, height: 128)
        logoImageView.layer.cornerRadius = 128/2
        
        view.addSubview(appNameLabel)
        appNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        appNameLabel.anchor(top: logoImageView.bottomAnchor, paddingTop: 12)

        view.addSubview(descriptionLabel)
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descriptionLabel.anchor(top: appNameLabel.bottomAnchor, paddingTop: 4)
        
        return view
    }()
    

    
    let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nao Track App"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)

        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Indoor location in the background"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold, traits: .traitItalic)
        return label
    }()
    
    lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [headerView, formStackView, messageStackView, footerLabel])
        stackView.frame = view.bounds
        stackView.backgroundColor = .white
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 20
        
        headerView.anchor(width: view.frame.size.width, height: 300)
        
        formStackView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        formStackView.isLayoutMarginsRelativeArrangement = true
        
        messageStackView.setContentHuggingPriority(.defaultLow, for: .vertical)
        messageStackView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        messageStackView.isLayoutMarginsRelativeArrangement = true
        
        footerLabel.anchor(width: view.frame.size.width, height: 100)
        
        return stackView
    }()
    
    
    let footerLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .bluePolestar
        label.text = "About Nao Track App && NAOSDK version"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .heavy, traits: .traitItalic)
//        label.font = .systemFont(ofSize: 16, weight: .bold)

        return label
    }()
    
    var apikeyTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Enter the apikey"
        textField.backgroundColor = .white
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.borderBluePolestar.cgColor
        textField.layer.cornerRadius = 10
        textField.layer.masksToBounds = true
        return textField
    }()
    
    let scanApikeyBtn: UIButton = {
        let button = UIButton()
        let icon = UIImage(named: "qrcode")
        button.setImage(icon?.withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let continueBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.backgroundColor = .bluePolestar
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 10
//        button.layer.style = .systemFont(ofSize: 16, weight: .bold)
        
        button.addTarget(self,
                              action: #selector(onContinueBtnClicked),
                              for: .touchUpInside)
        return button
    }()
    
    lazy var apikeyStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [apikeyTextField, scanApikeyBtn])
        stackView.frame = view.bounds
        
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 4.0
        scanApikeyBtn.anchor(width: 50, height: 50)
        return stackView
    }()
    
    lazy var formStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [apikeyStackView, continueBtn])
        stackView.frame = view.bounds
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 16.0
        
        continueBtn.anchor(height: 50)
        return stackView
    }()
    
    let homeTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
        
        textView.textAlignment = NSTextAlignment.center
        textView.backgroundColor = UIColor.lightGray

        // Use RGB colour
        textView.backgroundColor = .white

        // Update UITextView font size and colour
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.textColor = UIColor.black

        textView.font = UIFont.boldSystemFont(ofSize: 20)
        textView.font = UIFont(name: "Verdana", size: 17)
        
        return textView
    }()
    
    lazy var messageStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [homeTextView])
        stackView.frame = view.bounds
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 0.0
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.continueBtn.addTarget(self,
                              action: #selector(onContinueBtnClicked),
                              for: .touchUpInside)
        
        self.scanApikeyBtn.addTarget(self,
                              action: #selector(onScanApikeyBtnClicked),
                              for: .touchUpInside)
        
        view.addSubview(containerStackView)
        
        self.apikeyTextField.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.continueBtn.isEnabled = false
        self.continueBtn.alpha = 0.5
    }
    
    private func matches(for regex: String, in text: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
    func parseApikeys (apikeysString: String){
//        print("result:\(apikeysString)")
        let pattern = "naoApikey\\s*:\\s*(.+?)(?=,|$)"
        let matchedNaoApikeyObj = matches(for: pattern, in: apikeysString)
        
        if let firstNaoApikey = matchedNaoApikeyObj.first,
            let range = firstNaoApikey.range(of: "naoApikey:") {
            let matchedNaoApikey = String(firstNaoApikey[range.upperBound...])
            self.apikeyTextField.insertText(matchedNaoApikey)
            self.continueBtn.isEnabled = true
            self.continueBtn.alpha = 1.0
//            print("NAO Api Key:\(matchedNaoApikey)")
        }
    }
    
    @IBAction func onScanApikeyBtnClicked(_ sender: UIButton) {
        //QRCode with Camera switch and Torch
        let scanner = ScannerViewController(cameraImage: UIImage(named: "camera"), cancelImage: UIImage(named: "cancel"), flashOnImage: UIImage(named: "flash-on"), flashOffImage: UIImage(named: "flash-off"))
        scanner.delegate = self
        self.present(scanner, animated: true, completion: nil)
    }

    @objc func onContinueBtnClicked(_ sender: UIButton) {
        if let apikey = self.apikeyTextField.text {
            let vc = LoginViewController()
            vc.apikey = apikey
            print(apikey)
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }

    }
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
}
extension HomeViewController: QRScannerCodeDelegate {
    func qrScanner(_ controller: UIViewController, scanDidComplete result: String) {
        parseApikeys(apikeysString: result)
    }
    
    func qrScannerDidFail(_ controller: UIViewController, error: String) {
        print("error:\(error)")
    }
    
    func qrScannerDidCancel(_ controller: UIViewController) {
        print("SwiftQRScanner did cancel")
    }
}


extension HomeViewController : UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (self.apikeyTextField.text! as NSString).replacingCharacters(in: range, with: string)
        if text.isEmpty {
            self.continueBtn.isEnabled = false
            self.continueBtn.alpha = 0.5
        }
        else {
            self.continueBtn.isEnabled = true
            self.continueBtn.alpha = 1.0
        }
        return true
    }

    public func textFieldDidBeginEditing(_ textField: UITextField) {
        self.apikeyTextField = textField as! CustomTextField
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

extension UINavigationController {
    
    override open var shouldAutorotate: Bool {
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.shouldAutorotate
            }
            return super.shouldAutorotate
        }
    }
    
    override open var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.preferredInterfaceOrientationForPresentation
            }
            return super.preferredInterfaceOrientationForPresentation
        }
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.supportedInterfaceOrientations
            }
            return super.supportedInterfaceOrientations
        }
    }
}
