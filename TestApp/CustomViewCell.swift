//
//  CustomViewCell.swift
//  TestApp
//
//  Created by jay kumar on 05/05/24.
//

import UIKit

class CustomViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView : UIView!
    @IBOutlet weak var tiltleLBL : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func loadValue(_ title : String){
        beautifyView()
        tiltleLBL.text = title
        tiltleLBL.sizeToFit()
    }
    func beautifyView(){
        containerView.layer.cornerRadius = 8
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.clipsToBounds = false
    }
}
