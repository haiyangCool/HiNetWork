//
//  ViewController.swift
//  NetManagerDemo
//
//  Created by 王海洋 on 2020/2/18.
//  Copyright © 2020 王海洋. All rights reserved.
//

import UIKit
import HiNetWork
class ViewController: UIViewController {

    lazy var demoApiManager: DemoAPIManager = {
        let demoApiManager = DemoAPIManager()
        demoApiManager.resultDelegate = self
        demoApiManager.paramsSource = self
        return demoApiManager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 60))
        btn.setTitle("加载数据", for: .normal)
        btn.backgroundColor = .brown
        btn.addTarget(self, action: #selector(loadData(btn:)), for: .touchUpInside)
        view.addSubview(btn)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func loadData(btn: UIButton) {
        
        
        /// let _ = demoApiManager.loadData()
        
        /// 并发
        let queue = DispatchQueue(label: "com.hi.net", attributes: .concurrent)
    
        queue.async {
            let _ = self.demoApiManager.loadData()

        }
        
        queue.async {
            let _ = self.demoApiManager.loadData()

        }
        
    }
}

extension ViewController: HiAPIManagerResultDelegate, HiAPIManagerParameterDelegate {
    func success(_ manager: HiBaseAPIManager) {
        let data:Dictionary<String,Any>? = manager.fetchData(with:nil) as? Dictionary<String, Any>
        print("result = \(String(describing: data))")
        
    }
    
    func faild(_ manager: HiBaseAPIManager) {
        let faildType = manager.faildType()
        print("Faild = \(faildType)")
        
    }
    
    func parameters(_ manager: HiBaseAPIManager) -> [String : String]? {
         return [
                   "apiKey":"123fd90af7904388804555f1090d71db",
                   "categoryId":"1",
                   "topType":"1",
                   "limit":"50"
               ]
    }
    
    
}
