//
//  HomeViewController.swift
//  SampleProject
//
//  Created by Denis Svichkarev on 29/06/24.
//

import UIKit

class HomeViewController: UIViewController {
    var userViewModel: UserViewModel?
    var homeViewModel: HomeViewModel?
    
    var stateAViewController: HomaStateAViewController!
    var stateBViewController: HomaStateBViewController!

    var currentState: HomeState = .stateA {
           didSet {
               updateViewState()
           }
       }
    
    init(userViewModel: UserViewModel, homeViewModel: HomeViewModel) {
        self.userViewModel = userViewModel
        self.homeViewModel = homeViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        stateAViewController = HomaStateAViewController()
        stateBViewController = HomaStateBViewController()
         
        add(stateAViewController)
     }
    
    private func updateViewState() {
        switch currentState {
        case .stateA:
            replace(stateBViewController, with: stateAViewController)
        case .stateB:
            replace(stateAViewController, with: stateBViewController)
        }
    }
        
    private func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.view.frame = view.bounds
        child.didMove(toParent: self)
    }
        
    private func remove(_ child: UIViewController) {
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
        
    private func replace(_ oldChild: UIViewController, with newChild: UIViewController) {
        add(newChild)
        remove(oldChild)
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func timerDidFire() {
        currentState.toggle()
    }
}
