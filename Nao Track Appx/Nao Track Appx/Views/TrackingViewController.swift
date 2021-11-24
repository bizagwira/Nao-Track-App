//
//  TrackingViewController.swift
//  Nao Track App
//
//  Created by Pole Star on 24/11/2021.
//

import UIKit

class TrackingViewController: UIViewController {
    
    var apikey: String?
    let menuHeight: CGFloat = 128
    let menuActionArray: [MenuAction] = [
        MenuAction(name: "Home", image: UIImage(named: "home-run")!)
    ]
    
    // Mark - Properties
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        view.addSubview(logoImageView)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.anchor(top: view.topAnchor, paddingTop: 88, width: 128, height: 128)
        logoImageView.layer.cornerRadius = 128/2
        
        view.addSubview(menuBtn)
        menuBtn.anchor(top: view.topAnchor, right: view.rightAnchor, paddingTop: 44, paddingRight: 32, width: 32, height: 32)
        
        view.addSubview(appNameLabel)
        appNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        appNameLabel.anchor(top: logoImageView.bottomAnchor, paddingTop: 12)

        view.addSubview(descriptionLabel)
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descriptionLabel.anchor(top: appNameLabel.bottomAnchor, paddingTop: 4)
        
        return view
    }()
    
    let transparentView: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.9)
        return view
    }()
    
    lazy var menuTableView: UITableView = {
        let tableView = UITableView()
        let screenSize = UIScreen.main.bounds.size
        tableView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: self.menuHeight)
        return tableView
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
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
    let menuBtn: UIButton = {
        let button = UIButton()
        let icon = UIImage(named: "menu")
        button.setImage(icon?.withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [headerView, messageStackView, footerLabel])
        stackView.frame = view.bounds
        stackView.backgroundColor = .white
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 20
        
        headerView.anchor(width: view.frame.size.width, height: 300)
        
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
    

    
    let homeTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
        textView.textAlignment = NSTextAlignment.center
        textView.backgroundColor = UIColor.lightGray

        // Use RGB colour
        textView.backgroundColor = .white

        // Update UITextView font size and colour
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
        
        view.addSubview(containerStackView)
        
        self.menuBtn.addTarget(self,
                              action: #selector(onMenuBtnClicked),
                              for: .touchUpInside)
        
        setupMenuTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupMenuTableView() {
        
        self.menuTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.menuTableView.dataSource = self
        self.menuTableView.delegate = self
        
        self.menuTableView.separatorStyle = .none
        self.menuTableView.layer.masksToBounds = true
        self.menuTableView.layer.borderWidth = 2.0
        self.menuTableView.layer.borderColor = UIColor.white.cgColor
    }
    
    @IBAction func onMenuBtnClicked(_ sender: UIButton) {
        let screenSize = UIScreen.main.bounds.size
        let window = UIApplication.shared.keyWindow
        
        self.transparentView.frame = self.view.frame
        window?.addSubview(self.transparentView)
        window?.addSubview(self.menuTableView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTransparentViewClicked))
        self.transparentView.addGestureRecognizer(tapGesture)
        self.transparentView.alpha = 0
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0.5
            self.menuTableView.frame = CGRect(x: 0, y: screenSize.height - self.menuHeight, width: screenSize.width, height: self.menuHeight)
        }, completion: nil)
        
        
    }
    
    @objc func onTransparentViewClicked() {
        let screenSize = UIScreen.main.bounds.size
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0
            self.menuTableView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: self.menuHeight)
        }, completion: nil)
    }
    
    @IBAction func onStartBtnClicked(_ sender: UIButton) {
       
    }
    
    @objc func onReturnHomeBtnClicked() {
        let vc = HomeViewController()
        vc.modalPresentationStyle = .fullScreen
        UIApplication.topViewController()?.present(vc, animated: true, completion: nil)
    }
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
}

extension TrackingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuActionArray.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = self.menuTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell else {
            fatalError("Unable to deque cell")
        }
        cell.backgroundColor = UIColor.white
        cell.nameLabel.text = (menuActionArray[indexPath.row]).name
        cell.iconView.image = (menuActionArray[indexPath.row]).image
        cell.backgroundColor = .bluePolestar
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView,
                   viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = self.menuTableView.cellForRow(at: indexPath) as? CustomTableViewCell else {
            fatalError("Unable to deque cell")
        }
        
        guard let selectedApikey = cell.nameLabel.text, !selectedApikey.isEmpty else {
            return
        }
        
        print(selectedApikey)
        
        if selectedApikey == "Home" {
            onReturnHomeBtnClicked()
        }
    }
}
