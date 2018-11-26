//
//  ContentViewController.swift
//  JAPagerExample
//
//  Created by Jayachandra on 11/26/18.
//  Copyright © 2018 BlueRose Technologies Pvt Ltd. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    var emoji = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let label = UILabel(frame: view.bounds)
        label.text = emoji
        label.font = UIFont.systemFont(ofSize: 100)
        label.textAlignment = .center
        view.addSubview(label)
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
