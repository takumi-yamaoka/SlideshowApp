//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 山岡巧 on 2020/06/17.
//  Copyright © 2020 takumi.yamaoka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var switchButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet var onTapAction: UITapGestureRecognizer!
    
    
    
    let imageNameArray = ["man1.jpeg","man2.jpeg","man3.jpeg","man4.jpeg","man5.jpeg"]
    var dispImageNo = 0
    var timer: Timer!

    @IBAction func backButton(_ sender: Any) {
        dispImageNo -= 1
        displayImage()
    }
    
    @IBAction func nextButton(_ sender: Any) {
        dispImageNo += 1
        displayImage()
    }
    
    
    func displayImage() {
        
        if dispImageNo < 0 {
            dispImageNo = 4
        }
        if dispImageNo > 4 {
            dispImageNo = 0
        }
        
        let name = imageNameArray[dispImageNo]
        let image = UIImage(named: name)
        imageView.image = image
    }
    
    
    
    @IBAction func switchButton(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            nextButton.isEnabled = false
            backButton.isEnabled = false
            switchButton.setTitle("停止", for: .normal)
            self.view.backgroundColor = UIColor.lightGray
            switchButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        } else if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            nextButton.isEnabled = true
            backButton.isEnabled = true
            switchButton.setTitle("再生", for: .normal)
            self.view.backgroundColor = UIColor.white
            switchButton.titleLabel?.font =
            UIFont.systemFont(ofSize: 20)
        }
    }
    
    @objc func updateTimer(_ timer: Timer) {
        if dispImageNo < imageNameArray.count - 1 {
            dispImageNo += 1
            displayImage()
            print(dispImageNo)
        } else {
            dispImageNo = 0
            displayImage()
            print(dispImageNo)
        }
    }
    
    @IBAction func onTapAction(_ sender: Any) {

        self.performSegue(withIdentifier: "toZoomIn", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
        }
        switchButton.setTitle("再生", for: .normal)
        let SlideViewController:SlideViewController = segue.destination as! SlideViewController
        let name = imageNameArray[dispImageNo]
        let image = UIImage(named: name)
        SlideViewController.selectedImg = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "man1.jpeg")
        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}

