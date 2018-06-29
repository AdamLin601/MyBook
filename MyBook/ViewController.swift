//
//  ViewController.swift
//  MyBook
//
//  Created by 林奕德 on 2018/4/10.
//  Copyright © 2018年 AppsAdamLin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPageViewControllerDataSource {
    
    var pageViewController:UIPageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
       pageViewController = storyboard.instantiateViewController(withIdentifier: "pageViewController") as? UIPageViewController
        
        pageViewController?.dataSource = self
        
        pageViewController?.view.frame = self.view.frame //符合現在imageView大小
        if let okpageViewController = pageViewController{
            addChildViewController(okpageViewController)
            view.addSubview(okpageViewController.view)
        }
        pageViewController?.didMove(toParentViewController: self)
        guard  let starPage = viewControllerAtIndex(index: 0) else {return}
       
        pageViewController?.setViewControllers( [starPage], direction: .forward, animated: true, completion: nil)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
       let vc = viewController as? ContentViewController
        guard var index = vc?.nowPageNumber else{return nil} //頁碼
        if index == 0 || index == NSNotFound{
            return nil
        }else{
            index -= 1
           return viewControllerAtIndex(index: index)
        }
    }//上一頁動作

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let vc = viewController as? ContentViewController
        guard var index = vc?.nowPageNumber else {return nil}
        if index == NSNotFound {
            return nil
        }else{
            index += 1
            if index >= 3{
                return nil
            }else{
               return viewControllerAtIndex(index: index)
            }
        }
    }//下一頁
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewControllerAtIndex(index:Int)->ContentViewController? {//呼叫這個方法 給頁數index
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let contentViewController =  storyboard.instantiateViewController(withIdentifier: "mainContentViewController") as? ContentViewController
        contentViewController?.nowPageNumber = index
        return contentViewController
    }

}

