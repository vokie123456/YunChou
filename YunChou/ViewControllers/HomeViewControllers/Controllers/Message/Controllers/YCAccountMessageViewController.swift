//
//  YCAccountMessageViewController.swift
//  swiftRNTest
//
//  Created by yy on 2018/9/27.
//  Copyright © 2018年 yy. All rights reserved.
//

import UIKit

class YCAccountMessageViewController: BaseController {

    private let accountMessageCll = "accountMessageCll"
    
    lazy var tableView : UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(YCAccountMessageTableViewCell.self, forCellReuseIdentifier: accountMessageCll)
        
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
            tableView.estimatedSectionFooterHeight = 0;
            tableView.estimatedSectionHeaderHeight = 0;
            
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableView.automaticDimension
        
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "账户消息"
        self.leftView.isHidden = false
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(NaviBarHeight)
            make.left.right.equalTo(view).offset(0)
            make.height.equalTo(Main_Screen_Height - NaviBarHeight)
        }
        
        // Do any additional setup after loading the view.
    }

}
extension YCAccountMessageViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:YCAccountMessageTableViewCell = tableView.dequeueReusableCell(withIdentifier: accountMessageCll, for: indexPath) as! YCAccountMessageTableViewCell
        return cell
    }
    
    
}