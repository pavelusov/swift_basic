//Создать простое приложение, которое выводит некоторую коллекию картинок используя UICollectionView. (Картинки нужно добавить в assets)
//1) На экране расположить UICollectionView, создать кастомную ячейку с UIImageView внутри. Выводить ячейки одинакового размера, по две ячейки в ряд. Соблюсти, чтобы расстояния между ячейками со всех сторон были одинаковые.
//2) Разбить данные на несколько секций и отделить пустым расстоянием секции между собой.
//* Добавить на экран UISegmentedControl, с двумя опциями скрола (Vertical/Horizontal). При выборе опции менять направление скрола коллекции.
//** Добавить возможность менять количество столбцов в коллекции.
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
