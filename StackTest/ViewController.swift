//
//  ViewController.swift
//  StackTest
//
//  Created by Umberto Raimondi on 11/09/15.
//  Copyright © 2015 Umberto Raimondi. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var stackView:UIStackView!
    var nestedStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints=false
        self.view.addSubview(stackView)
        // Main UIStackView contraints, nearly fills its parent view
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[stackView]-30-|",
                                                                options: NSLayoutFormatOptions.alignAllLeading,metrics: nil, views: ["stackView":stackView]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[stackView]-10-|",
                                                                options: NSLayoutFormatOptions.alignAllLeading,metrics: nil, views: ["stackView":stackView]))
        
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 25
        stackView.distribution = .fillProportionally
        
        var lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.text="这是服务器管理工具，功能全，比较重。 如果喜欢把所有服务都装在一起的话，装上这个也不错。默认用户 root，密码 admin。 Ajenti 强烈建议使用 SSL 连接，但是 Safari 访问非 443 端口使用自签证书的服务器会比较麻烦，所以我暂时禁用了，可以进管理界面打开。 不使用 SSL 有安全隐患，请避免在生产环境使用这样的配置。 另外，重签证书可以用 ajenti-ssl-gen hostname.com -f; service ajenti restart"
        lbl.backgroundColor = UIColor.red
        
        let lab1Container = UIView()
        lab1Container.addSubview(lbl)
        lab1Container.backgroundColor = UIColor.blue
        
        stackView.addArrangedSubview(lab1Container)
//        lab1Container.snp.makeConstraints { (make) in
//            make.height.equalTo(60)
//        }
        lab1Container.addSubview(lbl)
        lbl.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        lbl = UILabel()
        lbl.text="Label 2"
        lbl.backgroundColor = UIColor.green
        stackView.addArrangedSubview(lbl)
        
        nestedStackView.axis = .horizontal
        nestedStackView.alignment = .fill
        nestedStackView.spacing = 25
        nestedStackView.distribution = .fillEqually
        nestedStackView.addArrangedSubview(UIButton(type: .infoDark))
        nestedStackView.addArrangedSubview(UIButton(type: .infoLight))
        nestedStackView.addArrangedSubview(UIButton(type: .contactAdd))
        stackView.addArrangedSubview(nestedStackView)
        
        let btn=UIButton(type: .system)
        btn.setTitle("Press Me", for: .normal)
        btn.addTarget(self, action: #selector(pressedme(sender:)), for: UIControlEvents.touchUpInside)
        stackView.addArrangedSubview(btn)
        
    }
    
    @objc func pressedme(sender: UIButton!){
        UIView.animate(withDuration: 0.5) {
            self.nestedStackView.isHidden = !self.nestedStackView.isHidden
        }
        //stackView.removeArrangedSubview(lastLabel)
        //lastLabel.removeFromSuperview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

