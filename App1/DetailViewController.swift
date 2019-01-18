//
//  DetailViewController.swift
//  App1
//
//  Created by Emily-Khine Chu on 9/26/18.
//  Copyright © 2018 Emily-Khine Chu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var num = 0
   
    @IBOutlet weak var numOfCorrectAnswer: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
 numOfCorrectAnswer.text = String(num)
     
        // Do any additional setup after loading the view.
//        let defaults = UserDefaults.standard
//        defaults.removeObject(forKey: "num")
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
