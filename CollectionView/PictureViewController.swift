//
//  PictureViewController.swift
//  CollectionView
//
//  Created by Анастасия Клюшникова on 19.01.2024.
//

import UIKit

final class PictureViewController: UIViewController {
    
    private let smileImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(smileImage)
        smileImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            smileImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            smileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            smileImage.heightAnchor.constraint(equalToConstant: 130),
            smileImage.widthAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    func setSmileImage(_ name: String) {
        smileImage.image = UIImage(named: name)
    }
}
