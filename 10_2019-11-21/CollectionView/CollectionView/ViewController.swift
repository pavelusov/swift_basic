//
//  ViewController.swift
//  CollectionView
//
//  Created by Павел Усов on 26.11.2019.
//  Copyright © 2019 Pavel Usov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    
    let cellId = "ImageCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetup()
    }
    
    func collectionViewSetup() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }

}

extension ViewController: UICollectionViewDelegate  {
    
}

extension ViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? ImageCell else { return UICollectionViewCell() }
        
        return cell
    }
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        <#code#>
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
}
