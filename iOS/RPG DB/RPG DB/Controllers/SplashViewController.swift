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
    
    func blinkButton(){
        UIButton.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            self.startButton.alpha = 0.0
        }, completion: {
            (value: Bool) in
            UIButton.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                self.startButton.alpha = 0.75
            }, completion: {
                (value: Bool) in
                self.blinkButton()
            })
        })
    }
}
