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
    
    
    @IBOutlet weak var scrubSlider: UISlider!
    
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
        player.stop()
        loadMusicFile()
        
    }
    @IBAction func volumeSlider(sender: AnyObject)
    {
        player.volume = sliderVolume.value
    }
    
    @IBAction func scrubMusic(sender: AnyObject) {
        //scrub Slider
        player.currentTime = NSTimeInterval(scrubSlider.value)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMusicFile()
        
        //not referring to timer
        _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateScrubSlider"), userInfo: nil, repeats: true)
        
    }
    func updateScrubSlider(){
        scrubSlider.value = Float(player.currentTime)
    }
    
    func loadMusicFile()
    {
        let audioPath = NSBundle.mainBundle().pathForResource("riseagain", ofType: "mp3")
        
        do
        {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath!))
            scrubSlider.maximumValue = Float(player.duration)
            
        }catch{
            print(error)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

