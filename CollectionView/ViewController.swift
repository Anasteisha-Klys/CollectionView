//
//  ViewController.swift
//  CollectionView
//
//  Created by Анастасия Клюшникова on 19.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let countCell = 1
    private let spasing = 10.0

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = spasing
        layout.minimumInteritemSpacing = spasing
        layout.sectionInset = .init(top: 10, left: 20, bottom: 10, right: 20)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    private var array = ["bad", "favorite", "hate", "nice", "notPleasant", "routine"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigation()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false 
    }
    
    private func setupNavigation() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? MainCollectionViewCell else { return UICollectionViewCell() }
        
        let row = indexPath.row
        let picture = array[row]
        cell.setSmileImage(picture)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = indexPath.row
        let picture = array[row]
        
        let vc = PictureViewController()
        vc.setSmileImage(picture)
        navigationController?.show(vc, sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthCV = collectionView.bounds.width
        let insert = 20.0 * 2
        let widthInsert = widthCV - insert
        let spasingFull = spasing * Double(countCell - 1)
        let widthSpasing = widthInsert - spasingFull
        let width = widthSpasing / Double(countCell)
        
        return .init(width: width, height: width)
    }
}

