//
//  JAPageViewDemoController.swift
//  UIDemo
//
//  Created by Jayachandra on 11/22/18.
//  Copyright © 2018 BlueRose Technologies Pvt Ltd. All rights reserved.
//

import UIKit
import JAPagerViewController


class JAPageViewDemoController: UIViewController {

    @IBOutlet weak var pagerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let page1 = ContentViewController()
        page1.title = "Page1"
        page1.emoji = "👹"
        
        let page2 = ContentViewController()
        page2.title = "Page2"
        page2.emoji = "👿"
        
        let page3 = ContentViewController()
        page3.title = "Page3"
        page3.emoji = "👻"
        
        let page4 = ContentViewController()
        page4.title = "Page4"
        page4.emoji = "🙀"
        
        let page5 = ContentViewController()
        page5.title = "Page5"
        page5.emoji = "💩"
        
        let page6 = ContentViewController()
        page6.title = "______Page6__________"
        page6.emoji = "🤡"
        
        let page7 = ContentViewController()
        page7.title = "12______Page7__________"
        page7.emoji = "🤮"

        
        let pager = JAPagerViewController(pages: [page1,page2, page3, page4, page5, page6, page7])
        addChild(pager)
        pager.view.frame = view.bounds
        view.addSubview(pager.view)
        pager.didMove(toParent: self)
        pager.tabMenuHeight = 55
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
