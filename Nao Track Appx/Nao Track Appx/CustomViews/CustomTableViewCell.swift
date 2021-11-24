//
//  CustomTableViewCell.swift
//  Nao Track Appx
//
//  Created by Pole Star on 24/11/2021.
//

import UIKit

struct MenuAction {
    let name: String
    let image: UIImage
}

class CustomTableViewCell: UITableViewCell {

    lazy var backView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 50))
       
        return view
    }()
    
    lazy var iconView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 15, y: 10, width: 30, height: 30))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 60, y: 10, width: self.frame.width, height: 30))
        label.text = "Nao Track App"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "Verdana", size: 17)
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold, traits: .traitItalic)

        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.addSubview(backView)
        backView.addSubview(iconView)
        backView.addSubview(nameLabel)
        
        // Configure the view for the selected state
    }

}
