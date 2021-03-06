//
//  YCOrderMiddleTableViewCell.swift
//  YunChou
//
//  Created by yy on 2018/10/9.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class YCOrderMiddleTableViewCell: UITableViewCell {

    
    var numStrs : String = ""
    
    private lazy var backvc1 : UIView = {
        let backvc1 = UIView()
        backvc1.backgroundColor = UIColor.white
        return backvc1
    }()
    
    private lazy var tipLB1 : UILabel = {
        let tipLB1 = UILabel()
        tipLB1.textColor = YC_FontColor_45Dark
        tipLB1.font = YC_FONT_PFSC_Medium(15)
        return tipLB1
    }()
    
    private lazy var numLB : UILabel = {
        let numLB = UILabel()
        numLB.textColor = YC_FontColor_LightGray
        numLB.font = YC_FONT_PFSC_Medium(12)
        return numLB
    }()
    
    
    private lazy var numBtn : YCNumberButton = {
        let numBtn = YCNumberButton ()
        return numBtn
    }()
    

    private lazy var momeyLB1 : UILabel = {
        let momeyLB1 = UILabel()
        momeyLB1.textColor = YC_Color_Red
        momeyLB1.textAlignment = NSTextAlignment.right
        momeyLB1.font  = YC_FONT_PFSC_Semibold(15)
        return momeyLB1
    }()
    
    private lazy var arrowImage : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "persionArrow")
       return img
    }()
    
    
    private lazy var lin1 : UILabel = {
        let lin1 = UILabel ()
        lin1.backgroundColor = gof_RGBAColor(233,233,233,2)
        return lin1
    }()
    
    private lazy var tipImage : UIImageView = {
        let tipImage = UIImageView ()
        return tipImage
    }()
    
    private lazy var contentLB : UILabel = {
        let contentLB = UILabel ()
        contentLB.textColor = YC_FontColor_102Gray
        contentLB.numberOfLines = 0
        return contentLB
    }()
    
    private lazy var lin2 : UILabel = {
        let lin2 = UILabel ()
        return lin2
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    
    
    func createSubViews(){
        
        self.addSubview(self.backvc1)
        backvc1.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.right.equalTo(0)
            make.bottom.equalTo(0)
        }
        
        backvc1.addSubview(self.tipLB1)
        tipLB1.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(15)
            make.height.equalTo(52)
//            make.width.equalTo(60)
        }
       
    }
    
    func rowOneData(dic : NSDictionary){
        //第一个cell
        _ = backvc1.subviews.map {
            $0.removeFromSuperview()
        }
        createSubViews()

        backvc1.addSubview(self.numLB)
        numLB.snp.makeConstraints { (make) in
            make.left.equalTo(tipLB1.snp.right).offset(20)
            make.top.equalTo(0)
            make.width.equalTo(120)
            make.height.equalTo(52)
        }
        
        backvc1.addSubview(self.numBtn)
        numBtn.snp.makeConstraints { (make) in
            make.right.equalTo(-15)
            make.width.equalTo(110)
            make.height.equalTo(30)
            make.centerY.equalTo(backvc1.snp.centerY)
        }
        
        tipLB1.text = dic.object(forKey: "title") as! String
        
        if numStrs.isEmpty {
            numLB.text = dic.object(forKey: "allNum") as! String
        }else{
            numLB.text = numStrs
        }
        
        numLB.text = dic.object(forKey: "allNum") as! String
        numBtn.currentNum = dic.object(forKey: "currentNum") as! String
        numBtn.maxNum = dic.object(forKey: "maxNum") as! String
        addBottomLin()
        
        numBtn.numberHasChangedBlolc = { (numStr) -> () in
            //            print("-------:\(numStr)")
            self.numStrs = numStr!;
        }

    }
    
    func rowLastData(dic : NSDictionary){
        //最后一个cell
        _ = backvc1.subviews.map {
            $0.removeFromSuperview()
        }
        
        createSubViews()

        
        tipLB1.font = YC_FONT_PFSC_Semibold(16)
        
        backvc1.addSubview(self.tipImage)
        tipImage.snp.makeConstraints { (make) in
            make.left.equalTo(tipLB1.snp.right).offset(9)
            make.top.equalTo(17)
            make.width.height.equalTo(17)
        }
        
        backvc1.addSubview(self.contentLB)
        contentLB.snp.makeConstraints { (make) in
            make.top.equalTo(tipLB1.snp.bottom).offset(1)
            make.left.equalTo(15)
            make.right.equalTo(-15)
        }
        
        backvc1.addSubview(self.lin2)
        lin2.snp.makeConstraints { (make) in
            make.top.equalTo(contentLB.snp.bottom).offset(5)
            make.right.left.equalTo(0)
            make.height.equalTo(0.01)
            make.bottom.equalTo(-20)
        }
        
        
        tipLB1.text = dic.object(forKey: "title") as! String
         tipImage.image = UIImage.init(named: "yc_order_tips")
        contentLB.attributedText = YC_FONT_RowSpacing(5 , YC_FONT_PFSC_Medium(14), dic.object(forKey: "content") as! String)
        
    }
    
    func otherRowData(dic : NSDictionary){
        
        _ = backvc1.subviews.map {
            $0.removeFromSuperview()
        }
        
        createSubViews()
        
        backvc1.addSubview(self.momeyLB1)
        momeyLB1.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.right.equalTo(-15)
            make.height.equalTo(52)
            make.width.equalTo(200)
        }
        tipLB1.text = dic.object(forKey: "title") as! String
        momeyLB1.text = dic.object(forKey: "money") as! String
        addBottomLin()
    }
    
    
    func arrowRowData (dic : NSDictionary){
        _ = backvc1.subviews.map {
            $0.removeFromSuperview()
        }
        
        createSubViews()
        
        backvc1.addSubview(self.arrowImage)
        arrowImage.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.right.equalTo(-15)
            make.height.equalTo(13)
            make.width.equalTo(13)
        }
        backvc1.addSubview(self.momeyLB1)
        momeyLB1.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.right.equalTo(arrowImage.snp.left).offset(-5)
            make.height.equalTo(52)
            make.width.equalTo(200)
        }
        
        tipLB1.text = dic.object(forKey: "title") as! String
        momeyLB1.text = dic.object(forKey: "money") as! String
        addBottomLin()
        
    }

    
    
    func changeMoneyLayout(){
        momeyLB1.snp.remakeConstraints { (make) in
            make.top.equalTo(0)
            make.right.equalTo(-45)
            make.height.equalTo(52)
            make.width.equalTo(200)
        }
    }
    
    func addBottomLin (){
        //底线
        backvc1.addSubview(self.lin1)
        lin1.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(tipLB1.snp.bottom).offset(0)
            make.height.equalTo(0.6)
            make.bottom.equalTo(0)
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
