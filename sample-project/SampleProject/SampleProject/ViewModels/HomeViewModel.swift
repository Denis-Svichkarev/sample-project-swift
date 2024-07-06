//
//  HomeViewModel.swift
//  SampleProject
//
//  Created by Denis Svichkarev on 06/07/24.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func timerDidFire()
}

class HomeViewModel {
    private var timerService: TimerService
    
    weak var delegate: HomeViewModelDelegate?
    
    init() {
        self.timerService = TimerService()
        self.timerService.delegate = self
        self.timerService.startTimer(withTimeInterval: 3)
    }
}

extension HomeViewModel: TimerServiceDelegate {
    func timerDidFire() {
        delegate?.timerDidFire()
    }
}
