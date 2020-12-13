//
//  UIViewController+Extension.swift
//  iOSSampleAPP
//
//  Created by Muhammad Waqas on 11/12/2020.
//

import UIKit
import MBProgressHUD

extension UIViewController {
    
    func showHUD() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func hideHUD() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func showAlert(title: String = "Error", message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
}
