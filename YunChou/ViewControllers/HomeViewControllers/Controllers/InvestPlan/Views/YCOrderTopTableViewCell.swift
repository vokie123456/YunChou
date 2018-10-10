//
//  YCOrderTopTableViewCell.swift
//  YunChou
//
//  Created by yy on 2018/10/9.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class YCOrderTopTableViewCell: UITableViewCell {

    private lazy var backs : UIView = {
        let vc = UIView()
//        vc.backgroundColor = YCColorWhite
        return vc
    }()

    private lazy var bcimage : UIImageView = {
        let bcimage = UIImageView()
        return bcimage
    }()
    
    private lazy var titleLB : UILabel = {
        let titleLB = UILabel()
        titleLB.textColor = UIColor.white
        titleLB.font = YC_FONT_PFSC_Semibold(16)
        return titleLB
    }()
    
    private lazy var moneyLB : UILabel = {
        let moneyLB = UILabel()
        moneyLB.textColor = UIColor.white
        return moneyLB
    }()
    
    private lazy var progressView : UIProgressView = {
        let progressView = UIProgressView ()
        progressView.progressViewStyle = UIProgressView.Style.default
        return progressView
    }()
    
    private lazy var residualLB : UILabel = {
        let residualLB = UILabel()
        residualLB.textColor = UIColor.white
        residualLB.font = YC_FONT_PFSC_Regular(12)
        return residualLB
    }()
    
    
    private lazy var spacelb : UILabel = {
        let lb = UILabel()
//        lb.backgroundColor = gof_RGBAColor(233,233,233,1)
        return lb
    }()
    
    private lazy var backVC : UIView = {
        let vc = UIView()
        vc.backgroundColor = YCColorWhite
        return vc
    }()

    private lazy var locationBtn : YCButton = {
       let btn = YCButton()
        btn.setTitleColor(YC_FontColor_45Dark, for: .normal)
        btn.titleLabel?.font = YC_FONT_PFSC_Regular(13)
        btn.setImage(UIImage.init(named: "yc_order_location"), for: .normal)
        btn.setTitle("北京 北京市 朝阳区", for: .normal)
        //        btnOnt.addTarget(self, action: #selector(progresBtnClickHandel), for: .touchUpInside)
        btn.layoutContent(style: YCButtonLayoutStyle.ImageLeftContentStart, imgSize: CGSize(width: 16, height: 16), space: 8)
        return btn
    }()
    
    private lazy var addressBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("东三环北路28号 博瑞大厦B座5层东三环北路28号 博瑞大厦B座5层东三环北路28号 博瑞大厦B座5层", for: .normal)
        btn.setTitleColor(YC_FontColor_45Dark, for: .normal)
        btn.titleLabel?.font = YC_FONT_PFSC_Medium(16)
        btn.titleLabel?.numberOfLines = 0
        btn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        return btn
    }()
    
    private lazy var rowImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "")
        return image
    }()
    
    private lazy var nameLB : UILabel = {
        let lb = UILabel ()
        lb.textColor = YC_FontColor_45Dark
        lb.font = YC_FONT_PFSC_Regular(14)
        return lb
    }()
    
    private lazy var linImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "yc_order_linImage")
        return image
    }()
    
    private lazy var emailTF : UITextField = {
        let tf = UITextField()
        tf.font = YC_FONT_PFSC_Medium(15)
        tf.textColor = YC_FontColor_45Dark
        return tf
    }()
    
    private lazy var linlb : UILabel = {
        let lb = UILabel()
        lb.backgroundColor = gof_RGBAColor(233,233,233,1)
        return lb
    }()
    
    private lazy var tipBtn : YCButton = {
        let btn = YCButton()
        btn.setTitleColor(gof_RGBAColor(166,166,166,1), for: .normal)
        btn.titleLabel?.font = YC_FONT_PFSC_Medium(12)
        btn.setImage(UIImage.init(named: "yc_order_tips"), for: .normal)
        btn.setTitle("请正确填写收件信息，以便向您寄送回报商品或协议", for: .normal)
        btn.isUserInteractionEnabled = false
        btn.layoutContent(style: YCButtonLayoutStyle.ImageLeftContentStart, imgSize: CGSize(width: 18, height: 18), space: 8)
        return btn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = YCBackground_LightColor
        createSubViews()
    }
    
    func addBottomVC(){
        self.addSubview(spacelb)
        spacelb.snp.makeConstraints { (make) in
            make.top.equalTo(bcimage.snp.bottom).offset(0)
            make.left.right.equalTo(0)
            make.height.equalTo(0.01)
            make.bottom.equalTo(0)
        }
    }
    
    func createSubViews(){

        self.addSubview(self.bcimage)
        bcimage.snp.makeConstraints { (make) in
            make.top.left.equalTo(12)
            make.right.equalTo(-12)
            make.height.equalTo(143)
        }
        
        bcimage.addSubview(self.titleLB)
        titleLB.snp.makeConstraints { (make) in
            make.top.equalTo(24)
            make.left.equalTo(31)
            make.height.equalTo(21)
            make.right.equalTo(-5)
        }
        
        bcimage.addSubview(self.moneyLB)
        moneyLB.snp.makeConstraints { (make) in
            make.top.equalTo(titleLB.snp.bottom).offset(4)
            make.left.equalTo(31)
            make.height.equalTo(28)
            make.right.equalTo(-5)
        }
        
        bcimage.addSubview(self.progressView)
        progressView.snp.makeConstraints { (make) in
            make.top.equalTo(moneyLB.snp.bottom).offset(15)
            make.left.equalTo(31)
            make.height.equalTo(5)
            make.right.equalTo(-32)
            
        }
        progressView.layer.masksToBounds = true
        progressView.layer.cornerRadius = 5/2
        
        bcimage.addSubview(self.residualLB)
        residualLB.snp.makeConstraints { (make) in
            make.left.equalTo(31)
            make.height.equalTo(22)
            make.right.equalTo(-5)
            make.top.equalTo(progressView.snp.bottom).offset(9)
        }

        bcimage.image = UIImage.init(named: "yc_invest_bcimage")
        
        titleLB.text = "复华丽江国际度假世界-收益权方案-"
        
        let num = "5"
        let money = "￥30000.00"
        let stt1 = "\(money) /份 (限购\(num)份)"
        moneyLB.font = YC_FONT_PFSC_Regular(12)
        let attributedStr : NSMutableAttributedString = NSMutableAttributedString.init(string: stt1)
        let r1 = stt1.range(of: money)
        let rang = "".nsRange(from: r1!)
        attributedStr.addAttributes([NSAttributedString.Key.font : YC_FONT_PFSC_Semibold(20)], range: rang)
        moneyLB.attributedText = attributedStr
        
        progressView.progressTintColor = gof_RGBAColor(250,200,81,1)
        progressView.trackTintColor = YC_Color_DDarkBlue
        progressView.progress = 0.3
        
        let re = "34"
        let stt = "剩余 \(re) 份 / 共50份"
        let attributedStr2 : NSMutableAttributedString = NSMutableAttributedString.init(string: stt)
        let r2 = stt.range(of: re)
        let rang2 = "".nsRange(from: r2!)
        attributedStr2.addAttributes([NSAttributedString.Key.foregroundColor:gof_RGBAColor(250,200,81,1)], range: rang2)
        residualLB.attributedText = attributedStr2
        
        
    }
    
    func createOtherView(){
        let leftn = 19
        
        self.addSubview(self.backVC)
        backVC.snp.makeConstraints { (make) in
            make.top.equalTo(bcimage.snp.bottom).offset(0)
            make.left.right.equalTo(0)
            make.bottom.equalTo(0)
        }
        backVC.addSubview(self.locationBtn)
        locationBtn.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.left.equalTo(leftn)
            make.right.equalTo(-leftn)
            make.height.equalTo(20)
        }
        backVC.addSubview(self.addressBtn)
        addressBtn.snp.makeConstraints { (make) in
            make.top.equalTo(locationBtn.snp.bottom).offset(10)
            make.left.equalTo(leftn)
            make.right.equalTo(-leftn)
        }
        
        backVC.addSubview(self.nameLB)
        nameLB.snp.makeConstraints { (make) in
            make.top.equalTo(addressBtn.snp.bottom).offset(10)
            make.left.equalTo(leftn)
            make.right.equalTo(-leftn)
            make.height.equalTo(21)

        }
        
        backVC.addSubview(self.linImage)
        linImage.snp.makeConstraints { (make) in
            make.top.equalTo(nameLB.snp.bottom).offset(15)
            make.left.right.equalTo(0)
            make.height.equalTo(4)
        }
        
        backVC.addSubview(self.emailTF)
        emailTF.snp.makeConstraints { (make) in
            make.top.equalTo(linImage.snp.bottom).offset(15)
            make.left.equalTo(leftn)
            make.right.equalTo(-leftn)
            make.height.equalTo(22)
        }
        emailTF.placeholder = "请输入您的邮箱"
        
        backVC.addSubview(self.linlb)
        linlb.snp.makeConstraints { (make) in
            make.top.equalTo(emailTF.snp.bottom).offset(15)
            make.left.right.equalTo(0)
            make.height.equalTo(0.7)
        }
        
        backVC.addSubview(self.tipBtn)
        tipBtn.snp.makeConstraints { (make) in
            make.top.equalTo(linlb.snp.bottom).offset(15)
            make.left.equalTo(leftn)
            make.right.equalTo(-leftn)
            make.height.equalTo(22)
            make.bottom.equalTo(-15)
        }

        tipBtn.setTitle("请正确填写收件信息，以便向您寄送回报商品或协议", for: .normal)
        addressBtn.setTitle("东三环北路28号 博瑞大厦B座5层", for: .normal)
        nameLB.text = "毛特你  138 8383 7878"
        
    
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
