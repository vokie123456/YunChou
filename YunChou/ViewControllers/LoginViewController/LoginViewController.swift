//
//  LoginViewController.swift
//  YunChou
//
//  Created by grx on 2018/9/28.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class LoginViewController: BaseController {
    
    var isSmsLogin = true
    var isShowPass = false
    let bigTitleLable = UILabel()
    let smsLoginView = UIView() //短信验证码登录
    let acountLoginView = UIView() //密码登录
    let checkButton = UIButton(type: .custom)

    let smsView = SMSCodeView()
    let loginView = MyFootButtonView()
    
    // MARK:=========视图将要显示时调用该方法
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true;
    }
    
    // MARK:=========当视图将要消失时调用该方法
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = YCColorWhite
        self.creaUI()
        self.creatBackButton()
        self.creatSmsView()
        self.creatAcountView()
        self.creatLoginView()
    }
    
    
    //MARK:==========创建视图
    func creaUI(){
        let bgImage = UIImageView()
        bgImage.image = UIImage(named: "bgLogin")
        self.view.addSubview(bgImage)
        bgImage.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(-0)
            make.height.equalTo(Screen_Height/2-kWidth(R: 100))
        }
        bigTitleLable.text = "短信验证码登录"
        bigTitleLable.font = YC_FONT_PFSC_Semibold(17)
        bigTitleLable.textColor = YCColorBlack
        self.view.addSubview(bigTitleLable)
        bigTitleLable.snp.makeConstraints { (make) in
            make.top.equalTo(bgImage.snp.bottom).offset(15)
            make.left.equalTo(20)
            make.right.equalTo(-0)
        }
        let imageArray:Array = ["login_phone","login_sms"]
        //MARK:=======图片
        for i in 0..<imageArray.count {
            let headImage = UIImageView()
            headImage.image = UIImage(named: imageArray[i])
            self.view.addSubview(headImage)
            headImage.tag = i+100
            headImage.snp.makeConstraints { (make) in
                make.top.equalTo(bigTitleLable.snp.bottom).offset(25+i*65)
                make.left.equalTo(30)
                make.width.equalTo(20)
                make.height.equalTo(25)
            }
            let lineView = UIView()
            self.view.addSubview(lineView)
            lineView.backgroundColor = YCColorLoginLine
            lineView.snp.makeConstraints { (make) in
                make.top.equalTo(bigTitleLable.snp.bottom).offset(70+i*62)
                make.left.equalTo(75)
                make.right.equalTo(0)
                make.height.equalTo(1)
            }
        }
    }
    
    //MARK==========短信验证码登录
    func creatSmsView() {
        self.view.addSubview(smsLoginView)
        smsLoginView.isHidden = false
        smsLoginView.snp.makeConstraints { (make) in
            make.top.equalTo(bigTitleLable.snp.bottom).offset(20)
            make.left.equalTo(75)
            make.right.equalTo(0)
            make.height.equalTo(120)
        }
        
        let titleArray:Array = ["手机号","请输入验证码"]
        for i in 0..<titleArray.count {
            let textField = UITextField()
            smsLoginView.addSubview(textField)
            textField.placeholder = titleArray[i]
            textField.font = YC_FONT_PFSC_Medium(14)
            textField.textColor = YCColorBlack
            textField.clearButtonMode = .never
            textField.setModifyClearButton()// 添加自定义清除按钮
            textField.tag = i+10
            textField.snp.makeConstraints { (make) in
                make.top.equalTo(i*65)
                make.left.equalTo(0)
                make.right.equalTo(-15)
                make.height.equalTo(40)
            }
            if(textField.tag==11){
                textField.snp.updateConstraints { (make) in
                    make.right.equalTo(-120)
                }
            }
        }
        let lineView = UIView()
        smsLoginView.addSubview(lineView)
        lineView.backgroundColor = YCColorLoginLine
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(63)
            make.right.equalTo(-115)
            make.width.equalTo(1)
            make.height.equalTo(40)
        }
        smsLoginView.addSubview(smsView)
        smsView.backgroundColor = YCColorWhite
        smsView.snp.makeConstraints { (make) in
            make.top.equalTo(65)
            make.left.equalTo(lineView.snp.right).offset(0)
            make.right.equalTo(0)
            make.height.equalTo(40)
        }
        smsView.sendCodeBlock = {() in
            //验证码倒计时
            self.smsView.countDown(timeOut: 60)
        }
    }
    
    //MARK==========账号密码登录
    func creatAcountView() {
        self.view.addSubview(acountLoginView)
        acountLoginView.isHidden = true
        acountLoginView.snp.makeConstraints { (make) in
            make.top.equalTo(bigTitleLable.snp.bottom).offset(20)
            make.left.equalTo(75)
            make.right.equalTo(0)
            make.height.equalTo(120)
        }
        
        let titleArray:Array = ["手机号","登录密码"]
        for i in 0..<titleArray.count {
            let textField = UITextField()
            acountLoginView.addSubview(textField)
            textField.placeholder = titleArray[i]
            textField.font = YC_FONT_PFSC_Medium(14)
            textField.textColor = YCColorBlack
            textField.clearButtonMode = .never
            textField.setModifyClearButton()// 添加自定义清除按钮
            textField.tag = i+20
            textField.snp.makeConstraints { (make) in
                make.top.equalTo(i*65)
                make.left.equalTo(0)
                make.right.equalTo(-80)
                make.height.equalTo(40)
            }
            if(textField.tag==21){
                textField.isSecureTextEntry = true
            }
        }
        checkButton.setImage(UIImage(named: "login_menu_uncheck"), for: .normal)
        acountLoginView.addSubview(checkButton)
        checkButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(-25)
            make.right.equalTo(-25)
            make.width.equalTo(30)
            make.height.equalTo(20)
        }
        checkButton.addTarget(self, action:#selector(checkButtonClick(_:)), for:.touchUpInside)
    }
    
    func creatLoginView() {
        /*! 注册阅读协议 */
        let xieyiLable = WPHotspotLabel()
        xieyiLable.numberOfLines = 1
        xieyiLable.font = YC_FONT_PFSC_Semibold(14)
        xieyiLable.textColor = YCColorDarkLight
        xieyiLable.textAlignment = NSTextAlignment.center
        self.view.addSubview(xieyiLable)
        xieyiLable.snp.makeConstraints { (make) in
        make.top.equalTo(smsView.snp.bottom).offset(15)
        make.left.equalTo(0)
        make.right.equalTo(-0)
        make.height.equalTo(40)
        }
        let xieyStyle:Dictionary = ["body":YC_FONT_PFSC_Medium(11),
                                    "pro":WPAttributedStyleAction.styledAction(action: {
                                //注册协议跳转
                                let registAgreVC = RegitAgreController()
                                self.navigationController?.pushViewController(registAgreVC, animated: true)
                                    }),
                                    "link":YCColorBlue] as [String : Any]
        xieyiLable.attributedText = "点击登录，即表示同意<pro>《注册协议》</pro>".attributedString(withStyleBook: xieyStyle)
        //登录按钮
        self.view.addSubview(loginView)
        loginView.sureOverBtn.setTitle("注册/登录", for: .normal)
        loginView.snp.makeConstraints { (make) in
            make.top.equalTo(xieyiLable.snp.bottom).offset(25)
            make.right.equalTo(-0)
            make.left.equalTo(0)
            make.height.equalTo(60)
        }
        loginView.sureOverBtn.titleLabel?.font = YC_FONT_PFSC_Semibold(17)
        loginView.sureOverBtn.layer.cornerRadius = 25
        loginView.sureOverBtn.snp.updateConstraints { (make) in
            make.height.equalTo(50)
        }
        loginView.sureOvercallBlock = {() in
            
        }
        let loginArray:Array = ["密码登录","忘记密码?"]
        //密码登录/忘记密码
        for i in 0..<2 {
            let passLoginBtn = UIButton(type: .custom)
            passLoginBtn.setTitle(loginArray[i], for: .normal)
            passLoginBtn.setTitleColor(YCColorDarkLight, for: .normal)
            passLoginBtn.titleLabel?.font = YC_FONT_PFSC_Medium(14)
            passLoginBtn.tag = i+1000
            self.view.addSubview(passLoginBtn)
            passLoginBtn.snp.makeConstraints { (make) in
                make.top.equalTo(loginView.snp.bottom).offset(5)
                make.left.equalTo((Main_Screen_Width/2-100)+CGFloat(i*110))
                make.width.equalTo(90)
                make.height.equalTo(40)
            }
            passLoginBtn.addTarget(self, action:#selector(passLoginClick(_:)), for:.touchUpInside)
        }
        let lineView = UIView()
        self.view.addSubview(lineView)
        lineView.backgroundColor = YCColorLoginLine
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(loginView.snp.bottom).offset(15)
            make.centerX.equalTo(self.view)
            make.width.equalTo(1)
            make.height.equalTo(20)
        }
    }
    
    func creatBackButton() {
        //自定义返回按钮
        let leftView = UIButton(type: .custom);
        leftView.frame = CGRect(x:0, y:StatusBarHeight, width:100, height:50)
        leftView.addTarget(self, action: #selector(loginBackToPrevious), for: .touchUpInside)
        let button =   UIButton(type: .custom)
        button.frame = CGRect(x:25, y:10, width:30, height:30)
        button.setBackgroundImage(UIImage(named:"back_white"), for: .normal)
        button.addTarget(self, action: #selector(loginBackToPrevious), for: .touchUpInside)
        leftView.addSubview(button)
        self.view.addSubview(leftView)
    }
    
    //MARK:======== 切换登录方式
    @objc func passLoginClick(_ button:UIButton){
        if (button.tag==1000) {
            button.setTitle(isSmsLogin ? "短信登录" : "密码登录", for: .normal)
            smsLoginView.isHidden = isSmsLogin ? true : false
            acountLoginView.isHidden = isSmsLogin ? false : true
            let titleImage:UIImageView = self.view.viewWithTag(101) as! UIImageView
            titleImage.image = UIImage(named: isSmsLogin ? "login_pass" : "login_sms")
            bigTitleLable.text = isSmsLogin ? "密码登录" : "短信验证码登录"
            isSmsLogin = !isSmsLogin
        }else{
            let forgetPassVC = ForgetPassController()
            self.navigationController?.pushViewController(forgetPassVC, animated: true)
        }
    }
    
    //MARK:======== 是否显现密码
    @objc func checkButtonClick(_ button:UIButton){
        let acountPassField:UITextField = self.view.viewWithTag(21) as! UITextField
        acountPassField.isSecureTextEntry = isShowPass ? true : false
        checkButton.setImage(UIImage(named: isShowPass ? "login_menu_uncheck" : "login_menu_check"), for: .normal)
        isShowPass = !isShowPass
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.PickUpKeyboard()
    }
    
    func PickUpKeyboard() {
        for i in 0..<2 {
            let smsTextField:UITextField = self.view.viewWithTag(i+10) as! UITextField
            let acountTextField:UITextField = self.view.viewWithTag(i+20) as! UITextField
            smsTextField.resignFirstResponder()
            acountTextField.resignFirstResponder()
        }
    }
    
    
    @objc func loginBackToPrevious()
    {
        self.dismiss(animated: true, completion: nil)
    }
}
