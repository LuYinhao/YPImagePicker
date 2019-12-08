//
//  BaseNavigationController.swift
//  Swift-Base
//
//  Created by 卢荫豪 on 2019/4/10.
//  Copyright © 2019 卢荫豪. All rights reserved.
//

import UIKit

open class BaseNavigationController: UINavigationController,UINavigationControllerDelegate {
    
    var popDelegate: UIGestureRecognizerDelegate?
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.initTheme()
        self.popDelegate = self.interactivePopGestureRecognizer?.delegate
        self.delegate = self
        
    }
    // MARK: - UINavigationControllerDelegate方法
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        if viewController == self.viewControllers[0] {
            
            self.interactivePopGestureRecognizer!.delegate = self.popDelegate
        }
        else {
            self.interactivePopGestureRecognizer!.delegate = nil
        }
    }
    ///设置主题
    func initTheme() {
        //返回等按钮主题
//        self.navigationBar.tintColor=themeTextColor
//        self.navigationBar.isTranslucent = false
//        ///title的颜色
//        self.navigationBar.titleTextAttributes=[NSAttributedString.Key.foregroundColor:themeTextColor,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 18)]
    }
    
    override open func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count>=1 { viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "back"), style: .plain, target: self, action: #selector(backBtnDidClick))
            // 隐藏要push的控制器的tabbar
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}
// MARK: - 返回点击事件
extension BaseNavigationController {
    @objc private func backBtnDidClick() {
        popViewController(animated: true)
    }
}
