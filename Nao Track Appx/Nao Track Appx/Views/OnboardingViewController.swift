//
//  OnboardingViewController.swift
//  Nao Track Appx
//
//  Created by Pole Star on 24/11/2021.
//

import UIKit

class OnboardingViewController: UIViewController {

    var apikey: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if Core.shared.isApikeyPresentInUserDefaults() {
            // Show the tracking view
            let vc = LoginViewController()
            vc.modalPresentationStyle = .fullScreen
//            present(vc, animated: true)
            UIApplication.topViewController()?.present(vc, animated: true, completion: nil)
            
        }
        else {
            // Show the login view
            let vc = HomeViewController()
            vc.modalPresentationStyle = .fullScreen
            UIApplication.topViewController()?.present(vc, animated: true, completion: nil)
            
            
        }
    }
}


class Core {
    static let shared = Core ()
    
    func isApikeyPresentInUserDefaults() -> Bool{
        return UserDefaults.standard.object(forKey: "apikey") != nil
    }
    
    func setApikeyInUserDefaults(apikey: String){
        UserDefaults.standard.set(apikey, forKey: "apikey")
    }
}


extension UIApplication {
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}
