//
//  JAPagerViewController.swift
//  UIDemo
//
//  Created by Jayachandra on 11/26/18.
//  Copyright © 2018 BlueRose Technologies Pvt Ltd. All rights reserved.
//

import UIKit



public class JAPagerViewController: UIViewController {

    @IBOutlet weak private var tabsMenuView: UIView!
    @IBOutlet weak private var contentCollectionView: UICollectionView!
    @IBOutlet weak private var tabsCollectionView: UICollectionView!
    @IBOutlet weak private var tabsMenuHeightConstraint: NSLayoutConstraint!

    
    open var pages = [UIViewController]() {
        didSet{
            reload()
        }
    }
    open var equalTabTitleWidth: Bool = false
    open var tabTitleWidth: CGFloat = 80
    open var selectedIndex: Int = 0
    open var tabMenuHeight: CGFloat = 44 {
        didSet {
            if let heightConstraint = tabsMenuHeightConstraint {
                heightConstraint.constant = tabMenuHeight
                reload()
            }
        }
    }

    
    init(pages aPages: [UIViewController]) {
        super.init(nibName: "JAPagerViewController", bundle: Bundle(for: JAPagerViewController.self))
        pages = aPages
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tabsCollectionView.register(JATabViewCell.self, forCellWithReuseIdentifier: "JATabViewCell")
        tabsCollectionView.register(UINib(nibName: "JATabViewCell", bundle:nil), forCellWithReuseIdentifier: "JATabViewCell")

        
        contentCollectionView.register(JATabContentCell.self, forCellWithReuseIdentifier: "JATabContentCell")
    }

    func reload() {
        tabsCollectionView.reloadData()
        contentCollectionView.reloadData()
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


extension JAPagerViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        if collectionView ==  contentCollectionView{
            return pages.count
        }
        return pages.count
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView ==  contentCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JATabContentCell", for: indexPath) as! JATabContentCell
            let page = pages[indexPath.row]
            addChild(page)
            cell.addSubview(page.view)
            page.didMove(toParent: self)
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JATabViewCell", for: indexPath) as! JATabViewCell
            cell.tabNameLabel.text = pages[indexPath.row].title
            if indexPath.row == selectedIndex {
                cell.tabNameLabel.textColor = UIColor.red
                cell.selectedIndicatiorView.backgroundColor = UIColor.green
                cell.selectedIndicatiorView.alpha = 0.0
                UIView.animate(withDuration: 0.5) {
                    cell.selectedIndicatiorView.alpha = 1.0
                }
            }else{
                cell.tabNameLabel.textColor = UIColor.black
                cell.selectedIndicatiorView.backgroundColor = UIColor.white
            }
            return cell
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView ==  contentCollectionView{
            return collectionView.frame.size
        }
        
        if equalTabTitleWidth {
            let estimatedSize = CGSize(width: tabTitleWidth,
                                       height: tabMenuHeight)
            return estimatedSize
        }
        
        let text = NSString(string: pages[indexPath.row].title!)
        let size = text.size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 23)])
        return CGSize(width: size.width, height: tabMenuHeight)
    }
}

extension JAPagerViewController: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == tabsCollectionView {
            selectedIndex = indexPath.row
            let indexPathToScrollContent = IndexPath(item: selectedIndex, section: 0)
            contentCollectionView.scrollToItem(at: indexPathToScrollContent, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
            collectionView.reloadData()
        }
    }
}

extension JAPagerViewController: UIScrollViewDelegate {
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let visibleCells = contentCollectionView.visibleCells
        if visibleCells.count > 0 &&  scrollView == contentCollectionView{
            if let currentCellIndexPath = contentCollectionView.indexPath(for: visibleCells.first!) {
                selectedIndex = currentCellIndexPath.row
                let indexPathToScroll = IndexPath(item: selectedIndex, section: 0)
                tabsCollectionView.scrollToItem(at: indexPathToScroll, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
                tabsCollectionView.reloadData()
            }
        }
    }
}





public class JATabContentCell: UICollectionViewCell {
    
}
