# JAPagerViewController

[![CI Status](https://img.shields.io/travis/JayachandraA/JAPagerViewController.svg?style=flat)](https://travis-ci.org/JayachandraA/JAPagerViewController)
[![Version](https://img.shields.io/cocoapods/v/JAPagerViewController.svg?style=flat)](https://cocoapods.org/pods/JAPagerViewController)
[![License](https://img.shields.io/cocoapods/l/JAPagerViewController.svg?style=flat)](https://cocoapods.org/pods/JAPagerViewController)
[![Platform](https://img.shields.io/cocoapods/p/JAPagerViewController.svg?style=flat)](https://cocoapods.org/pods/JAPagerViewController)

## Example

![alt text](https://github.com/JayachandraA/JAPagerViewController/blob/master/Example/pager.png) ![alt text](https://github.com/JayachandraA/JAPagerViewController/blob/development/Example/pager1.png)

Code Usage
```swift
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
        pager.view.frame = containerView.bounds
        containerView.addSubview(pager.view)
        pager.didMove(toParent: self)
```
To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

JAPagerViewController is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'JAPagerViewController'
```

## Author

JayachandraA, ajchandra15@gmail.com

## License

JAPagerViewController is available under the MIT license. See the LICENSE file for more info.
