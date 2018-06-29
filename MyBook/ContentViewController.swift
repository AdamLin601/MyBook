//
//  ContentViewController.swift
//  MyBook
//
//  Created by 林奕德 on 2018/4/10.
//  Copyright © 2018年 AppsAdamLin. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
   
    @IBOutlet weak var mainImageView: UIImageView!
    
    var nowPageNumber:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainImageView.image = UIImage(named: "\(nowPageNumber)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
