//
//  AlertProtocol.swift
//  F3_Test_App
//
//  Created by Azizbek Asadov on 07/02/21.
//

import UIKit

protocol AlertProtocol : AnyObject { }

extension AlertProtocol where Self: UIViewController {
    func showMessageDismissal(message: String?, actionName: String?, action: @escaping ()->()) {
        let viewController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        viewController.view.tintColor = UIColor.link
        viewController.addAction(UIAlertAction(title: actionName, style: UIAlertAction.Style.default, handler: { (_) in
            action()
        }))
        self.present(viewController, animated: true)
    }
    
    func showMessage(title: String?, message: String?, actionName: String?, action: @escaping ()->()) {
        let viewController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        viewController.view.tintColor = UIColor.link
        viewController.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
        viewController.addAction(UIAlertAction(title: actionName, style: UIAlertAction.Style.default, handler: { (_) in
            action()
        }))
        self.present(viewController, animated: true)
    }
    
    func showMessage(title: String?, message: String?, action: @escaping ()->()) {
        let viewController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        viewController.view.tintColor = UIColor.link
        viewController.addAction(UIAlertAction(title: "Later", style: UIAlertAction.Style.default, handler: nil))
        viewController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (_) in
            action()
        }))
        self.present(viewController, animated: true)
    }
    
    func showMessage(message: String?, completion: @escaping ()->()) {
        let viewController = UIAlertController(title: message, message: nil, preferredStyle: UIAlertController.Style.alert)
        viewController.view.tintColor = UIColor.link
        
        self.present(viewController, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                viewController.dismiss(animated: true, completion: completion)
            }
        }
    }
    
    func showMessage(message: String?) {
        let viewController = UIAlertController(title: message, message: nil, preferredStyle: UIAlertController.Style.alert)
        viewController.view.tintColor = UIColor.link
        
        self.present(viewController, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                viewController.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    /// USED FOR SIMPLE ALERT VIEWS - POP IT UP WHEN YOU GET INSTANT ERROR
    func showErrorMessage(message:String?) {
        let viewController = UIAlertController(title: "Oops!", message: message, preferredStyle: UIAlertController.Style.alert)
        viewController.view.tintColor = UIColor.link
        viewController.addAction(UIAlertAction.init(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
        self.present(viewController, animated: true, completion: nil)
    }
    
    /// USED FOR SIMPLE ALERT VIEWS - POP IT UP WHEN YOU GET INSTANT ERROR AND DO SOME ACTIONS
    func showErrorMessage(message: String?, completion: @escaping() -> ()) {
        let viewController = UIAlertController(title: "Oops!", message: message, preferredStyle: UIAlertController.Style.alert)
        viewController.view.tintColor = UIColor.link
        viewController.addAction(UIAlertAction.init(title: "Dismiss", style: UIAlertAction.Style.default, handler: { (_) in
            completion()
        }))
        self.present(viewController, animated: true, completion: nil)
    }
}
