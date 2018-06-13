//
//  ViewController.swift
//  swf-Keychain-demo
//
//  Created by S.Emoto on 2018/06/13.
//  Copyright © 2018年 S.Emoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let keychainManager = KeychainManager(withService: "testService", group: "sEmoto.jp.swf-Keychain-demo")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let resultSave = keychainManager.save(byKey: "testKey01", value: "testValue03")
        let resultRemove = keychainManager.delete(byKey: "testKey01")
        if resultSave && resultRemove {
            
            let data1 = keychainManager.getString(byKey: "testKey01")
            print(data1)
            
            let data2 = keychainManager.getString(byKey: "testKey02")
            print(data2)
        }
        
    }
}

