//
//  SlideViewController.swift
//  SlideshowApp
//
//  Created by 山岡巧 on 2020/06/20.
//  Copyright © 2020 takumi.yamaoka. All rights reserved.
//

import UIKit

class SlideViewController: UIViewController {

    @IBOutlet weak var SlideImage: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    
    let slideimage = 0
    var selectedImg: UIImage!
    let imageNameArray = ["man1.jpeg","man2.jpeg","man3.jpeg","man4.jpeg","man5.jpeg"]
    var dispImageNo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        SlideImage.image = selectedImg
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
       dismiss(animated: true, completion: nil)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
