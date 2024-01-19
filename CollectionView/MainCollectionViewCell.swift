//
//  MainCollectionViewCell.swift
//  CollectionView
//
//  Created by Анастасия Клюшникова on 19.01.2024.
//

import UIKit

final class MainCollectionViewCell: UICollectionViewCell {
    private let picture = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: .infinite)
        setupView()
        setupNavigation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(picture)
        picture.translatesAutoresizingMaskIntoConstraints = false
    
    }
    
    private func setupNavigation() {
        NSLayoutConstraint.activate([
            picture.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            picture.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            picture.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            picture.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setSmileImage(_ name: String) {
        picture.image = UIImage(named: name)
    }
}
