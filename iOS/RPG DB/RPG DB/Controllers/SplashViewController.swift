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
    }

}
