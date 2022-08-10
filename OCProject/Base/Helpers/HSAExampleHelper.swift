//
//  HSAExampleHelper.swift
//  OCProject
//
//  Created by stone on 2022/7/24.
//

import Foundation

class HSAExampleHelper:NSObject {
    //公开属性：
    public var publicString:String?
    //私有属性：
    private var publicInt:Int = 0;
    /**
     公开的实例方法：
     @param logicId 业务逻辑id
     */
    @objc public func publicInstanceMethod(_ logicId:String) {
    }
    /**
     公开的类方法：
     @param logicId 业务逻辑id
     */
    @objc public static func publicClassMethod(_ logicId:String) {
    }
    //私有的实例方法：
    @objc private func privateInstanceMethod() {
    }
    //私有的类方法：
    @objc private static func privateClassMethod() {
    }
}
