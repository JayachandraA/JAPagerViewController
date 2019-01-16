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
    
    @IBOutlet weak var titleContainerView: UIView!
    @IBOutlet weak var imageContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let page1 = self.storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        page1.title = "Page1"
        page1.emoji = "👹"
        
        let page2 = self.storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        page2.title = "Page2"
        page2.emoji = "👿"
        
        let page3 = self.storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        page3.title = "Page3"
        page3.emoji = "👻"
        
        let page4 = self.storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        page4.title = "Page4"
        page4.emoji = "🙀"
        
        let page5 = self.storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        page5.title = "Page5"
        page5.emoji = "💩"
        
        let page6 = self.storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        page6.title = "______Page6__________"
        page6.emoji = "🤡"
        
        let page7 = self.storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        page7.title = "12______Page7__________"
        page7.emoji = "🤮"

        
        let pager = JAPagerViewController(pages: [page1,page2, page3, page4, page5, page6, page7])

        pager.view.frame = titleContainerView.bounds
        addChild(pager)
        titleContainerView.addSubview(pager.view)
        pager.didMove(toParent: self)
        pager.tabMenuHeight = 55
        pager.tabItemWidthType = .dynamic
        pager.selectedTabTitleColor = UIColor.red
        pager.selectedTabTitleFont = UIFont.boldSystemFont(ofSize: 12)
        
        
        
        
        
        
        let imagePage1 = self.storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        imagePage1.title = "Page1"
        imagePage1.emoji = "👹"
        
        let imagePage2 = self.storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        imagePage2.title = "Page2"
        imagePage2.emoji = "👿"
        
        let imagePage3 = self.storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        imagePage3.title = "Page3"
        imagePage3.emoji = "👻"
        
        let imagePager = JAPagerViewController(pages: [imagePage1,imagePage2, imagePage3])
        addChild(imagePager)
        imagePager.view.frame = imageContainerView.bounds
        imageContainerView.addSubview(imagePager.view)
        imagePager.didMove(toParent: self)
        imagePager.tabMenuHeight = 55
        imagePager.tabItemWidthType = .custom
        imagePager.tabItemCustomWidth = view.frame.size.width/3
        imagePager.tabMenuType = .images(defaultImages: [#imageLiteral(resourceName: "home"), #imageLiteral(resourceName: "trending"), #imageLiteral(resourceName: "profile"),], selectedImages: nil)
 
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
