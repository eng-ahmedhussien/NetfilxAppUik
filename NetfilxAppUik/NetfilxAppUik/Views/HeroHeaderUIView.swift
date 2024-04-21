//
//  HeroHeaderUIView.swift
//  NetfilxAppUik
//
//  Created by ahmed hussien on 18/03/2024.
//

import UIKit

class HeroHeaderUIView: UIView {
    
    // MARK: - Properties
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
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
      return button
    }()
    private let dwonloadButton: UIButton = {
      let button = UIButton()
        button.setTitle("downlload", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
      return button
    }()

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addSubview(playButton)
        addSubview(dwonloadButton)
        applyConstraint()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    // MARK: - Constraints
    private func applyConstraint(){
        let playButtonconstraint = [
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -25),
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30),
            playButton.widthAnchor.constraint(equalToConstant: 120),
            playButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let downloadButtonConstraint = [
            dwonloadButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -25),
            dwonloadButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -30),
            dwonloadButton.widthAnchor.constraint(equalToConstant: 120),
            dwonloadButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(downloadButtonConstraint)
        NSLayoutConstraint.activate(playButtonconstraint)
    }
    
}

#Preview{
    HeroHeaderUIView()
}
