//
//  ViewController.swift
//  Ztopwatch
//
//  Created by svyatoslav-zubrin on 12/11/2019.
//  Copyright (c) 2019 svyatoslav-zubrin. All rights reserved.
//

import UIKit
import Ztopwatch

class ViewController: UIViewController {
    
    private var stopwatch: ZtopwatchI = Ztopwatch()

    // MARK: - Outlets

    @IBOutlet private weak var isRunningResultLabel: UILabel!
    @IBOutlet private weak var durationResultLabel: UILabel!

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK: - User actions
    
    @IBAction func start() {
        stopwatch.start()
    }
    
    @IBAction func stop() {
        stopwatch.stop()
    }
    
    @IBAction func reset() {
        stopwatch.reset()
        
        isRunningResultLabel.text = "---"
        durationResultLabel.text = "---"
    }
    
    @IBAction func measure() {
        logResults()
    }
    
    // MARK: - Private
    
    private func logResults() {
        isRunningResultLabel.text = "\(stopwatch.isRunning)"
        durationResultLabel.text = "\(stopwatch.duration)"
    }
}

