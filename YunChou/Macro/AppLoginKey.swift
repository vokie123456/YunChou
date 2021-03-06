//
//  AppLoginKey.swift
//  YunChou
//
//  Created by grx on 2018/10/17.
//  Copyright © 2018年 grx. All rights reserved.
//

import Foundation

#if DEBUG
let YCBASEURL = "http://vod.d5kitchen.com"
#else
let YCBASEURL = "http://vod.d5kitchen.com"
//let YCBASEURL = "http://192.168.75.7:8707/org/business/basics"
#endif

//web端请求server
let SERVERAPI = "/api/getService"

//是否登录
func ISLOGIN() -> Bool {
    return (MMKV.default()?.getBoolForKey("isLogin"))!
}
struct UserDefaultKeys {
    // 账户信息
    let userId = "userId"
    let userName = "userName"
    let phoneNum = "phoneNum"
}
//用户ID
func USERID() -> String {
    let userId = UserDefaults.standard.string(forKey: "userId")
    //判断UserDefaults中是否已经存在
    if userId != nil {
        return userId!
    }else{
        return ""
    }
}
//用户名
func USERNAME() -> String {
    let userName = UserDefaults.standard.string(forKey: "userName")
    //判断UserDefaults中是否已经存在
    if userName != nil {
        return userName!
    }else{
        return ""
    }
}
//手机号
func PHONEMUM() -> String {
    let phoneMum = UserDefaults.standard.string(forKey: "phoneNum")
    //判断UserDefaults中是否已经存在
    if phoneMum != nil {
        return phoneMum!
    }else{
        return ""
    }
}


