//
//  FailureStateViewController.swift
//  SampleProject
//
//  Created by Denis Svichkarev on 07.07.2024.
//

import UIKit

protocol FailureStateViewControllerDelegate: AnyObject {
    func tryAgainButtonPressed()
}

class FailureStateViewController: UIViewController {

    weak var delegate: FailureStateViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onTryAgainButtonPressed(_ sender: Any) {
        delegate?.tryAgainButtonPressed()
    }
}
