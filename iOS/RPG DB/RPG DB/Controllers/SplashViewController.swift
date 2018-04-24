//
//  SplashViewController.swift
//  RPG DB
//
//  Created by Wilson Ding on 4/23/18.
//  Copyright © 2018 Wilson Ding. All rights reserved.
//

import UIKit
import SwiftVideoBackground

class SplashViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(-1.0, forKey: "fight")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        try? VideoBackground.shared.play(
            view: view,
            videoName: "background",
            videoType: "mp4",
            isMuted: true,
            darkness: 0.25,
            willLoopVideo: true,
            setAudioSessionAmbient: true)
        
        blinkButton()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        VideoBackground.shared.pause()
        
        super.viewDidDisappear(animated)
    }
    
    func blinkButton(){
        UIButton.animate(withDuration: 0.1, delay: 1.25, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            self.startButton.alpha = 0.0
        }, completion: {
            (value: Bool) in
            UIButton.animate(withDuration: 0.1, delay: 0.6, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                self.startButton.alpha = 0.75
            }, completion: {
                (value: Bool) in
                self.blinkButton()
            })
        })
    }
}
