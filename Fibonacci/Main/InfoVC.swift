//
//  InfoVC.swift
//  Fibonacci
//
//  Created by YUNI on 2019/6/29.
//  Copyright © 2019 YUNI. All rights reserved.
//

import UIKit

class InfoVC: UIViewController {
    @IBOutlet weak var mainTxtView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Fibonacci Info"
        mainTxtView.text = "費氏數列(Fibonacci)"
            + "\n"
            + "\n"
            + "原理："
            + "\n"
            + "\n"
            + "F(0) = 0 \nF(1) = 1 \nF(n) = F(n-1) + F(n-2)"
            + "\n"
            + "\n"
            + "起源："
            + "\n"
            + "\n"
            + "起源於兔子的生育故事"
    }
}
