//
//  ViewController.swift
//  AudioDemo
//
//  Created by Simranjit Kaur on 25/02/2016.
//  Copyright © 2016 Simranjit Kaur. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()
   
    
    @IBOutlet weak var sliderVolume: UISlider!
    
    @IBAction func playButton(sender: AnyObject)
    {
        player.play()
    }
    @IBAction func pauseButton(sender: AnyObject)
    {
        player.pause()
    }
    @IBAction func stopButton(sender: AnyObject)
    {
        loadMusicFile()
        player.stop()
    }
    @IBAction func volumeSlider(sender: AnyObject)
    {
        player.volume = sliderVolume.value
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMusicFile()
        
    }
    
    func loadMusicFile()
    {
        let audioPath = NSBundle.mainBundle().pathForResource("riseagain", ofType: "mp3")
        
        do
        {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath!))
            
        }catch{
            print(error)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

