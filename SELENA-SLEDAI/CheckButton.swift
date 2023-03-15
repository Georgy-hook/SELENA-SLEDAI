//
//  CheckButton.swift
//  SELENA-SLEDAI
//
//  Created by Georgy on 16.02.2023.
//

import UIKit
import Foundation
class CheckButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override  func awakeFromNib() {
        self.setImage(UIImage(named: "unchecked")!,for: .normal)
    }
    func toggle(if check:Bool) {
        if check == false {
            self.setImage(UIImage(named: "unchecked")!,for: .normal)
        } else{
            self.setImage(UIImage(named: "checked")!,for: .normal)
        }
    }
}
