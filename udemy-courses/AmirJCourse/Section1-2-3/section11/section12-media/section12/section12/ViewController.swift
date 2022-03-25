//
//  ViewController.swift
//  section12
//
//  Created by NAVJOT SINGH on 2022-03-23.
//

import UIKit
import AVFoundation
import CoreMotion


extension UIColor{
    
    public static var themeColor:UIColor{
        return UIColor(named: "themeColors")!
    }
}

class ViewController: UIViewController, AVAudioPlayerDelegate, UIImagePickerControllerDelegate &  UINavigationControllerDelegate {
    
    var imgPicker:UIImagePickerController!
    @IBOutlet weak var imageholder: UIImageView!
    @IBOutlet weak var progress: UIProgressView!
    var audioPlayer:AVAudioPlayer?
    var pauseTime = 0.0
    var timer: Timer!
    let motionManager = CMMotionManager()
    
    var avRecorde:AVAudioRecorder!
    var file:URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageview = UIImageView()
       // imageview.image = Literal
        imageholder.backgroundColor = UIColor.themeColor
        imageview.backgroundColor = UIColor.themeColor
        progress.progress = 0.0
        // Do any additional setup after loading the view.
        //add music file and then play
        if let file  = Bundle.main.url(forResource: "Song", withExtension: "mp3"){
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: file)
                audioPlayer?.prepareToPlay()
            }
            catch let error as NSError{
                print(error.description)
            }
        }
        
        audioPlayer?.delegate = self
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation == .landscapeLeft{
            imageholder.backgroundColor = .red
        }else{
            imageholder.backgroundColor = .blue
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if !motionManager.isAccelerometerAvailable ||  !motionManager.isGyroAvailable{
            return
        }
        
        motionManager.gyroUpdateInterval = 0.01
        motionManager.accelerometerUpdateInterval = 0.01
        
        motionManager.startAccelerometerUpdates(to: .current!){
            (data, error) in
            guard let mData = data else{
                return
            }
            
            var center = self.imageholder.center
            
            center.x = CGFloat(mData.acceleration.x)
            center.y = CGFloat(mData.acceleration.y)
            
            self.imageholder.center = center
            
            
            
            print(mData)
        }
        
        motionManager.startGyroUpdates(to: .current!){ (data, error) in
            guard let gyroData = data else {
                return
            }
            
            
        }
    }
    
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print(#function, "PLaying finished")
    }
    
    
    @IBAction func play(_ sender: UIButton) {
        //        audioPlayer?.play()
        audioPlayer?.currentTime = pauseTime
        audioPlayer?.play()
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(monitorProgress), userInfo: nil, repeats: true)
    }
    
    @IBAction func pause(_ sender: UIButton) {
        audioPlayer?.pause()
        pauseTime = audioPlayer!.currentTime
        
        if let mTimer = timer{
            mTimer.invalidate()
        }
    }
    
    @objc func monitorProgress(){
        guard let audioPlayer =  audioPlayer else{return}
        
        let progressValue = audioPlayer.currentTime/audioPlayer.duration
        progress.progress = Float(progressValue)
        
    }
    
    @IBAction func stopRecording(_ sender: UIButton) {
        if let recoder = avRecorde{
            recoder.stop()
            avRecorde = nil
        }
        
    }
    @IBAction func playRecording(_ sender: UIButton) {
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: file)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        }catch{
            
        }
        
    }
    
    @IBAction func recordAudio(_ sender: UIButton) {
        let fileManager = FileManager.default
        
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        
        let firstUrl = urls[0] as URL
        print(firstUrl)
        file = firstUrl.appendingPathComponent("myRecording.m4a")
        
        do{
            avRecorde = try AVAudioRecorder(url: file, settings: [AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue,AVNumberOfChannelsKey:1, AVFormatIDKey: Int(kAudioFormatMPEG4AAC)])
            
            avRecorde.record()
            
        }catch{
            
        }
    }
    
    @IBAction func pickImage(_ sender: UIButton) {
        imgPicker = UIImagePickerController()
        
        self.imgPicker.delegate = self
        
        let pickerAlert = UIAlertController(title: "Pick image", message: "camer or gallery", preferredStyle: .alert)
        
        
        
        let camera = UIAlertAction(title: "Camera", style: .default ) {
            (act) in
            self.imgPicker.sourceType = .camera
            self.present(self.imgPicker, animated: true, completion: nil)
        }
        
        let gallery = UIAlertAction(title: "Gallery", style: .default) {
            (act) in
            self.imgPicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(self.imgPicker, animated: true, completion: nil)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            pickerAlert.addAction(camera)
        }
        
        
        pickerAlert.addAction(gallery)
        
        self.present(pickerAlert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let img = info[.originalImage] as? UIImage{
            imageholder.image = img
        }
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

