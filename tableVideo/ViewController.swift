//
//  ViewController.swift
//  tableVideo
//
//  Created by Sandeep Joshi on 12/4/18.
//  Copyright © 2018 Sandeep Joshi. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UITableViewController {

    let videoDict: [String: [String]] = ["Amrit Varsha Dhyan Sadhna": ["amrit", "Medidation"],
                                         "Dhyan Sadhna": ["ds", "Meditation"],
                                         "Dhyan Panch Kosh Jagran": ["dp", "Meditation"],
                                         "Gayatri Aarti": ["ga", "Meditation"],
                                         "Gurudev Gayatri Mantra": ["gm", "Meditation"],
                                         "Panchakosh Dhyan": ["pd", "Meditation"],
                                         "Morning Dhyan": ["md", "Meditation"]]
    
    func getThumbnailFrom(path: URL) -> UIImage? {
        do {
            let asset = AVURLAsset(url: path , options: nil)
            let imgGenerator = AVAssetImageGenerator(asset: asset)
            imgGenerator.appliesPreferredTrackTransform = true
            let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(value: 0, timescale: 1), actualTime: nil)
            let thumbnail = UIImage(cgImage: cgImage)
            return thumbnail
        } catch let error {
            print("*** Error generating thumbnail: \(error.localizedDescription)")
            return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.title = "Guided Mediation"
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
        }
        catch {
            print("Setting category to AVAudioSessionCategoryPlayback failed.")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (Array(videoDict.keys)).count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! videoTitleCell
        let key = Array(videoDict.keys)[indexPath.row]
        let array = videoDict[key]
        let videoURL = Bundle.main.url(forResource: array?[0], withExtension: "mp4", subdirectory: "videos")
        
//        cell.info1.text = array?[0]
        cell.info1.text = key
        cell.info2.text = array?[1]
        cell.thumbnail.image = getThumbnailFrom(path: videoURL!)
        
        return cell
        
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Table View Controller App"
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        let key = Array(videoDict.keys)[indexPath.row]
        let array = videoDict[key]
        print(array)
        if let videoURL = Bundle.main.url(forResource: array?[0], withExtension: "mp4", subdirectory: "videos") {
            let player = AVPlayer(url: videoURL)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            self.present(playerViewController, animated: true) {
                playerViewController.player!.play()
            }
        }
//        let player = AVPlayer(url: videoURL)
//        let playerViewController = AVPlayerViewController()
//        playerViewController.player = player
//        self.present(playerViewController, animated: true) {
//            playerViewController.player!.play()
//        }
    }
    
    
    
    
    


}

