//
//  FibonacciCell.swift
//  Fibonacci
//
//  Created by YUNI on 2019/6/29.
//  Copyright © 2019 YUNI. All rights reserved.
//

import UIKit

class FibonacciCell: UITableViewCell {
    @IBOutlet weak var noLabel: UILabel!
    @IBOutlet weak var ansLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initCell(no: String, ans: String) {
        noLabel.text = "No. " + no
        ansLabel.text = ans
    }
}
