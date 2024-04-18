//
//  HeroHeaderUIView.swift
//  NetfilxAppUik
//
//  Created by ahmed hussien on 18/03/2024.
//

import UIKit

class HeroHeaderUIView: UIView {
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "8")
        return imageView
    }()
    private let playButton: UIButton = {
      let button = UIButton()
        button.setTitle("play", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        button.translatesAutoresizingMaskIntoConstraints = false
      return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addSubview(playButton)
        applyConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    private func applyConstraint(){
        let constraint = [playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25),
                          playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)]
        NSLayoutConstraint.activate(constraint)
    }
    
    
}

#Preview{
    HeroHeaderUIView()
}
