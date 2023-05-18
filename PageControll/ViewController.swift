//
//  ViewController.swift
//  PageControll
//
//  Created by Aydin on 17.05.23.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    let items = [30, 50, 40]
    let cellSize: CGFloat = 200
    var navigationBarOriginalOffset : CGFloat?
    private let VscrollView = UIScrollView()
    private let HscrollView = UIScrollView()
    
    private let topView: UIView = UIView()
    private let middleView: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(VscrollView)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        topView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300)
        middleView.frame = CGRect(x: 0, y: topView.frame.height, width: view.frame.size.width, height: 100)
        topView.backgroundColor = .black
        middleView.backgroundColor = .yellow
        VscrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        HscrollView.frame = CGRect(x: 0, y: topView.frame.height + middleView.frame.height, width: view.frame.size.width, height: getHScrollViewHeight())
        HscrollView.translatesAutoresizingMaskIntoConstraints = false
        confHScrollView()
        configureScrollView()
//        navigationBarOriginalOffset = navigationBar.frame.origin.y
    }
    
    private func configureScrollView() {
        VscrollView.addSubview(topView)
        VscrollView.addSubview(middleView)
        VscrollView.addSubview(HscrollView)
        HscrollView.delegate = self
        VscrollView.contentSize = CGSize(width: view.frame.size.width, height: topView.frame.height + HscrollView.frame.height + middleView.frame.height)
    }
    

    private func configureHScrollView() {
        HscrollView.contentSize = CGSize(width: view.frame.size.width, height: HscrollView.frame.size.height)
        HscrollView.isPagingEnabled = true
        let page = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 1500))
        let collView = CollectionViewContentController(frame: page.frame)
        collView.items = 2
        page.addSubview(collView)
        HscrollView.addSubview(page)
    }
    
    func confHScrollView() {
        let colors: [UIColor] = [.red, .blue, .cyan]
        HscrollView.contentSize = CGSize(width: view.frame.size.width * CGFloat(items.count), height: HscrollView.frame.size.height)
        HscrollView.isPagingEnabled = true
        for x in 0 ..< items.count {
            let collView = CollectionViewContentController(
                frame: CGRect(
                    x: CGFloat(x) * view.frame.size.width,
                    y: 0,
                    width: view.frame.size.width,
                    height: CGFloat(items[x]) * cellSize
                )
            )
            collView.items = items[x]
//            collView.backgroundColor = colors[x]
            collView.name = "Collection View number: \(x + 1), there must be \(items[x]) cell"
            HscrollView.addSubview(collView)
        }
    }
    
    private func getHScrollViewHeight() -> CGFloat {
        guard let max = items.max() else { return 0 }
        return CGFloat(max) * cellSize
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        
        if scrollView.contentOffset.y > 240 {
            
            middleView.frame = CGRect(x: 0, y: scrollView.contentOffset.y+100, width: view.frame.size.width, height: 100)
        }
    }
}

