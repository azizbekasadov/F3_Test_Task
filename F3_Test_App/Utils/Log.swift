//
//  Log.swift
//  F3_Test_App
//
//  Created by Azizbek Asadov on 09/02/21.
//

import UIKit

class Log {
    class func output(_ text:Any, file:String = #file, method:String = #function, line:Int = #line) {
        let projectName = Bundle.main.infoDictionary!["CFBundleDisplayName"] as! String
        let time = Date().timeIntervalSince1970
        
        let offsetIndex = file.lastIndex(of: "/")!
        let fileName = file[offsetIndex..<file.endIndex]
        
        print("[\(projectName):\(time):\(fileName):\(method):\(line)] \(text)")
    }
}
