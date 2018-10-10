//
//  AcountmoneyController.swift
//  YunChou
//
//  Created by grx on 2018/10/10.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class AcountmoneyController: BaseController,UITableViewDelegate,UITableViewDataSource {
    let headView = AcMoneyHeadView()
    
    var accountMoneyStr:String?
    lazy var accountTableView = UITableView(frame: self.view.frame, style: .grouped)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "账户余额"
        self.view.backgroundColor = YCColorLight
        self.leftView.isHidden = false
        self.accountTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.accountTableView.delegate = self
        self.accountTableView.dataSource = self
        self.accountTableView.backgroundColor = YCColorLight
        //注册cell重用
        self.accountTableView .register(AccountMoneyCell.self, forCellReuseIdentifier: AccountMoneyCellIdentifier)
        self.view.addSubview(accountTableView)
    }
    
    //MARK:========tableViewDelegate协议代理
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 420
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //我的银行卡
        headView.selectBankCartBlock = {()in
            let myBankVC = MyBankCartController()
            self.navigationController?.pushViewController(myBankVC, animated: true)
        }
        //充值提现
        headView.selButtonClickBlock = {(tag:Int) in
            let saveMoneyVC = SaveMoneyController()
            let takeMoneyVC = TakeMoneyController()
            if (tag==10) {
                self.navigationController?.pushViewController(saveMoneyVC, animated: true)
            }else{
                self.navigationController?.pushViewController(takeMoneyVC, animated: true)
            }
        }
        return headView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:AccountMoneyCellIdentifier) as! AccountMoneyCell
        cell.selectionStyle = .none
        return cell
    }
    

    override func backToPrevious() {
        self.navigationController!.popViewController(animated: true)
    }


}
