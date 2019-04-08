//
//  ViewController.swift
//  DiceTest
//
//  Created by Sin-yuan Jiang on 2019/4/8.
//  Copyright © 2019 Sin-yuan Jiang. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var dicenames = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    var shakeMove: Timer?
    var player: AVPlayer?
    
    @IBOutlet weak var IvCup: UIImageView!
    @IBOutlet weak var btShake: UIButton!
    @IBOutlet var IvDice:[UIImageView]!
    @IBOutlet weak var diceCup: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        for IvDice in IvDice{
            IvDice.image = UIImage(named: dicenames.randomElement()!)
        }
//        let shakeMusic = Bundle.main.url(forResource: "rolldice", withExtension: "mp3")!
//        player = AVPlayer(url: shakeMusic)
//        player?.play()
    }
    
    
    @IBAction func btShake(_ sender: UIButton) {
        if sender.currentTitle == "Shake" {
            shakeMove = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: {(_)in
                for IvDice in self.IvDice{
                    IvDice.image = UIImage(named: self.dicenames.randomElement()!)
                }
            })
//            let shakeMusic = Bundle.main.url(forResource: "rolldice", withExtension: "mp3")!
//            player = AVPlayer(url: shakeMusic)
//            player?.play()
            sender.setTitle("Stop", for: UIControl.State.normal)
        } else if sender.currentTitle == "Stop"{
            shakeMove?.invalidate()
            sender.setTitle("Shake", for: UIControl.State.normal)
        }
    }
    
    @IBAction func btOpen(_ sender: UIButton) {
        if sender.currentTitle == "Open" {
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1, delay: 0, animations: {
                self.diceCup.frame.origin.y = -150
                self.diceCup.frame.origin.x = 67
//                self.diceCup.transform = CGAffineTransform(rotationAngle: CGFloat.pi/7)
            })
            sender.setTitle("Close", for: UIControl.State.normal)
            btShake.isEnabled = false
        } else if sender.currentTitle == "Close" {
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1, delay: 0, animations: {
                self.diceCup.transform = CGAffineTransform(rotationAngle: 0)
                self.diceCup.frame.origin.x = 67
                self.diceCup.frame.origin.y = 126
            })
            sender.setTitle("Open", for: UIControl.State.normal)
            btShake.isEnabled = true
        }
    
    }
    
    @IBAction func switchLook(_ sender: UISwitch) {
        if sender.isOn == true{
            IvCup.alpha = 0.8
        }else if sender.isOn == false{
            IvCup.alpha = 1
        }
    }
}

