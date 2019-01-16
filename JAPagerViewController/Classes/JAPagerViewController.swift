//
//  JAPagerViewController.swift
//  UIDemo
//
//  Created by Jayachandra on 11/26/18.
//  Copyright © 2018 BlueRose Technologies Pvt Ltd. All rights reserved.
//

import UIKit


/// Defines the Tab menu type
public enum JATabMenuType {
    /// The tab menu item will be set to the titles
    case titles( titles: [String])
    
    /// The tab menu item will be set to the images
    case images( defaultImages: [UIImage], selectedImages: [UIImage]?)
    
    /// The tab menu item will be set to the `pages`, i.e, UIViewController's title
    case none
}


/// Defines the Tab menu width
public enum JATabItemWidthType: Int {
    
    /// The tab menu item width will be set to equal size
    /// While setiing this, `tabEqualWidth` will be given as it's width
    case equal
    
    /// The tab menu item width will be calculated based on content
    case dynamic
    
    /// While setting this, it is required to set the `tabItemCustomWidth` property value
    /// SO that the width will be calculated for tab menu item
    case custom
}


public class JAPagerViewController: UIViewController {
    
    @IBOutlet weak fileprivate var tabsMenuView: UIView!
    @IBOutlet weak fileprivate var containerScrollView: UIScrollView!
    @IBOutlet weak fileprivate var tabsCollectionView: UICollectionView!
    @IBOutlet weak fileprivate var tabsMenuHeightConstraint: NSLayoutConstraint!
    
    
    /// The Tab meu item width will be set based on this property value
    open var tabItemWidthType: JATabItemWidthType = .equal {
        didSet {
            reload()
        }
    }
    
    
    /// The Tab meu item appearance will be set based on this property value
    open var tabMenuType: JATabMenuType = .none {
        didSet {
            reload()
        }
    }
    
    /// Thab menu item width will be set to its custom width
    open var tabItemCustomWidth: CGFloat = 0 {
        didSet {
            reload()
        }
    }
    
    
    /// Customize the tab menu item width based on this property
    /// The `tabEqualWidth` will be used when the 'tabItemWidthType' is set to `.equal`
    /// For more see `JATabItemWidthType`
    open var tabEqualWidth: CGFloat = 80 {
        didSet {
            reload()
        }
    }
    
    
    /// The current selcted content page will be displayed based on this property
    open var selectedPageIndex: Int = 0 {
        didSet {
            scrollContent(to: selectedPageIndex)
        }
    }
    
    
    /// The custom tab menu height will be given as this property
    open var tabMenuHeight: CGFloat = 44 {
        didSet {
            if let heightConstraint = tabsMenuHeightConstraint {
                heightConstraint.constant = tabMenuHeight
                reload()
            }
        }
    }
    
    /// Tab menu background color will be set to this property
    open var tabMenuBackgroundColor: UIColor = UIColor.gray.withAlphaComponent(0.3) {
        didSet {
            reload()
        }
    }
    
    /// The default tab menu item color will be given as this property
    open var tabTitleColor: UIColor = UIColor.lightGray {
        didSet {
            reload()
        }
    }
    
    /// The default tab menu item font will be given as this property
    open var tabTitleFont: UIFont = UIFont.systemFont(ofSize: 14) {
        didSet {
            reload()
        }
    }
    
    /// The selected tab menu item color will be given as this property
    open var selectedTabTitleColor: UIColor = UIColor.darkGray {
        didSet {
            reload()
        }
    }
    
    /// The selected tab menu item font will be given as this property
    open var selectedTabTitleFont: UIFont = UIFont.boldSystemFont(ofSize: 15) {
        didSet {
            reload()
        }
    }
    
    /// The selected bar color for the currently selected tab menu item
    open var selectedTabIndicatorColor: UIColor = UIColor.red {
        didSet {
            reload()
        }
    }
    
    
    //MARK: - Private properties
    var currentPage: Int = 0
    var pages = [UIViewController]()

    
    /// Default initializer with pages
    public init(pages aPages: [UIViewController]) {
        super.init(nibName: "JAPagerViewController", bundle: Bundle(for: JAPagerViewController.self))
        pages = aPages
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        setupContents()
        
        tabsCollectionView.register(JATabViewCell.self, forCellWithReuseIdentifier: "JATabViewCell")
        tabsCollectionView.register(UINib(nibName: "JATabViewCell", bundle:Bundle(for: JATabViewCell.self)), forCellWithReuseIdentifier: "JATabViewCell")
    }
    
    func setupContents() {
        for page in pages {
            addChild(page)
            containerScrollView.addSubview(page.view)
            page.didMove(toParent: self)
        }
    }
    
    func reload() {
        tabsCollectionView.backgroundColor = tabMenuBackgroundColor
        tabsCollectionView.reloadData()
        updateContentFrames()
    }
    
    func updateContentFrames() {
        let containerScrollViewSize = containerScrollView.frame.size
        let contentScrollWidth = containerScrollViewSize.width * CGFloat(pages.count)
        containerScrollView.contentSize = CGSize(width: contentScrollWidth, height: containerScrollViewSize.height)
        
        let initialY: CGFloat = 0.0
        var initialX: CGFloat = 0.0
        for (index, page) in pages.enumerated() {
            initialX = containerScrollViewSize.width * CGFloat(index)
            page.view.frame = CGRect(x: initialX, y: initialY, width: containerScrollViewSize.width, height: containerScrollViewSize.height)
        }
    }
    
    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateContentFrames()
    }
    
    func getTitleWidth(title: String, font: UIFont) ->CGFloat {
        let label = UILabel()
        label.font = font
        label.text = title
        label.numberOfLines = 1
        label.sizeToFit()
        return label.frame.width + (label.frame.width * 0.3)
    }
}


extension JAPagerViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JATabViewCell", for: indexPath) as! JATabViewCell
        cell.tabNameLabel.font = tabTitleFont
        switch tabMenuType {
        case .images(let defaultImages, let selectedImages):
            if let lSelectedImages = selectedImages, indexPath.row == currentPage {
                cell.imageView.image = lSelectedImages[indexPath.row]
            }else {
                cell.imageView.image = defaultImages[indexPath.row]
            }
        case .titles(let titles):
            cell.tabNameLabel.text = titles[indexPath.row]
            if indexPath.row == currentPage {
                cell.tabNameLabel.textColor = selectedTabTitleColor
                cell.tabNameLabel.font = selectedTabTitleFont
            }else {
                cell.tabNameLabel.textColor = tabTitleColor
            }
        case .none:
            cell.tabNameLabel.text = pages[indexPath.row].title
            if indexPath.row == currentPage {
                cell.tabNameLabel.textColor = selectedTabTitleColor
                cell.tabNameLabel.font = selectedTabTitleFont
            }else {
                cell.tabNameLabel.textColor = tabTitleColor
            }
        }
        
        
        // show selected tab indictor
        if indexPath.row == currentPage {
            cell.selectedIndicatiorView.alpha = 0.0
            cell.selectedIndicatiorView.backgroundColor = selectedTabIndicatorColor
            UIView.animate(withDuration: 0.5) {
                cell.selectedIndicatiorView.alpha = 1.0
            }
        }else{
            cell.selectedIndicatiorView.backgroundColor = UIColor.clear
        }
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch tabItemWidthType {
        case .custom:
            return CGSize(width: tabItemCustomWidth, height: tabMenuHeight)
        case .dynamic:
            switch tabMenuType {
            case .titles(let titles):
                if indexPath.row == currentPage{
                    let width = getTitleWidth(title: titles[indexPath.row], font: selectedTabTitleFont)
                    return CGSize(width: width, height: tabMenuHeight)
                }
                let width = getTitleWidth(title: titles[indexPath.row], font: tabTitleFont)
                return CGSize(width: width, height: tabMenuHeight)
            case .images(_, _):
                return CGSize(width: tabMenuHeight, height: tabMenuHeight)
            case .none:
                if indexPath.row == currentPage{
                    let width = getTitleWidth(title: pages[indexPath.row].title!, font: selectedTabTitleFont)
                    return CGSize(width: width, height: tabMenuHeight)
                }
                let width = getTitleWidth(title: pages[indexPath.row].title!, font: tabTitleFont)
                return CGSize(width: width, height: tabMenuHeight)
            }
        case .equal:
            let estimatedSize = CGSize(width: tabEqualWidth,
                                       height: tabMenuHeight)
            return estimatedSize
        }
    }
}

extension JAPagerViewController: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        scrollContent(to: indexPath.row)
    }
}

extension JAPagerViewController: UIScrollViewDelegate {
    
    fileprivate func scrollContent(to page: Int) {
        currentPage = page
        let containerWidth = containerScrollView.frame.size.width
        let containerHeight = containerScrollView.frame.size.height
        let initialY: CGFloat = 0.0
        let contentFrameToScroll = CGRect(x: containerWidth*CGFloat(page), y: initialY, width: containerWidth, height: containerHeight)
        containerScrollView.scrollRectToVisible(contentFrameToScroll, animated: true)
        scrollTabMenu(to: page)
    }
    
    fileprivate func scrollTabMenu(to selectedTab: Int) {
        let menuIndexPathToScroll = IndexPath(row: selectedTab, section: 0)
        tabsCollectionView.scrollToItem(at: menuIndexPathToScroll, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
        tabsCollectionView.reloadData()
    }
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == containerScrollView {
            let page: Int = Int(scrollView.contentOffset.x / scrollView.frame.size.width);
            scrollContent(to: page)
        }
    }
}
