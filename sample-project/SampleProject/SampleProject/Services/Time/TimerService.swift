//
//  TimerService.swift
//  SampleProject
//
//  Created by Denis Svichkarev on 06/07/24.
//

import Foundation

protocol TimerServiceDelegate: AnyObject {
    func timerDidFire()
}

class TimerService {
    weak var delegate: TimerServiceDelegate?
    private var timer: Timer?

    func startTimer(withTimeInterval interval: TimeInterval) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { [weak self] timer in
            self?.delegate?.timerDidFire()
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    deinit {
        stopTimer()
    }
}
