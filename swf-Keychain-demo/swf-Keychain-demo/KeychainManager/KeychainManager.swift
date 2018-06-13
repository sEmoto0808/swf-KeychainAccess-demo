//
//  KeychainManager.swift
//  swf-Keychain-demo
//
//  Created by S.Emoto on 2018/06/13.
//  Copyright © 2018年 S.Emoto. All rights reserved.
//


/*
 * ライブラリ：KeychainAccess
 * バージョン：3.1.1
 * ソースURL：https://github.com/kishikawakatsumi/KeychainAccess/
 */


import Foundation
import KeychainAccess

final class KeychainManager {
    
    var keychain:Keychain?
    
    //MARK: - Init
    init(withService service:String, group:String) {
        keychain = Keychain(service: service, accessGroup: group)
    }
}

extension KeychainManager {
    
    //MARK: - 保存・更新
    func save(byKey key:String, value:String) -> Bool {
        
        var isSuccess = false
        
        do {
            try keychain?.set(value, key: key)
            isSuccess = true
        } catch let error {
            print(error)
        }
        
        return isSuccess
    }
    
    //MARK: - 取得
    func getString(byKey key:String) -> String {
        
        do {
            let data = try keychain?.getString(key)
            print("data: \(String(describing: data))")
            
            guard let dataStr = data else {
                return "nil"
            }
            return dataStr
        } catch let error {
            print(error)
            return "Error"
        }
    }
    
    func getData(byKey key:String) -> Data? {
        
        do {
            let dataRow = try keychain?.getData(key)
            guard let data = dataRow else {
                return nil
            }
            print("data: \(String(describing: data))")
            return data
        } catch let error {
            print(error)
            return nil
        }
    }
    
    //MARK: - 削除
    func delete(byKey key:String) -> Bool {
        
        var isSuccess = false
        
        do {
            try keychain?.remove(key)
            isSuccess = true
        } catch let error {
            print(error)
        }
        
        return isSuccess
    }
}
