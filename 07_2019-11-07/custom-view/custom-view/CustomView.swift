//
//  CustomView.swift
//  custom-view
//
//  Created by Павел Усов on 10.11.2019.
//  Copyright © 2019 Pavel Usov. All rights reserved.
//

import UIKit

class CustomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        backgroundColor = UIColor(patternImage: UIImage(named: "android.png")!)
        print("custom view")
    }
}
