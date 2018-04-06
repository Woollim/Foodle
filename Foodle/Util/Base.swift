//
//  Base.swift
//  Foodle
//
//  Created by 이병찬 on 2018. 1. 2..
//  Copyright © 2018년 root. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func showIndicator() -> (() -> ()){
        let indicator = UIActivityIndicatorView.init(frame: CGRect.init(x: 0, y: 0, width: 108, height: 108))
        indicator.center = view.center
        indicator.activityIndicatorViewStyle = .whiteLarge
        indicator.backgroundColor = UIColor.gray.withAlphaComponent(0.4)
        indicator.layer.cornerRadius = 16
        view.addSubview(indicator)
        indicator.startAnimating()
        
        // FIXME: 여기 return문이 로직적으로 의미를 가지는 건가요?
        return indicator.removeFromSuperview
    }
    
    func showToast(msg: String){
        
        // FIXME: 토스트의 위치가 safe-area가 존재하는 화면은 고려가 안 되있는듯 합니다.
        let toast = UILabel.init(frame: CGRect.init(x: 32, y: view.frame.height - 156, width: view.frame.width - 64, height: 48))
        toast.layer.cornerRadius = 12
        toast.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        toast.text = msg
        toast.textColor = UIColor.white
        toast.textAlignment = .center
        toast.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        toast.clipsToBounds = true
        toast.autoresizingMask = [.flexibleTopMargin, .flexibleHeight, .flexibleWidth]
        view.addSubview(toast)
        UIView.animate(withDuration: 0.4, delay: 0.3, animations: { toast.alpha = 0.3 },
                       completion: { _ in toast.removeFromSuperview() })
    }
    
    func goBack(_ fun: (() -> ())? = nil){
        self.dismiss(animated: true, completion: fun)
    }
    
}
