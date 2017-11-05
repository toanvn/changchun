//
//  ViewController.swift
//  changchun
//
//  Created by Toan Phan on 10/31/17.
//  Copyright © 2017 Toan Phan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController , UICollectionViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = UIColor.blue
        cell.dislayContent(imgUrl: "")
        return cell;
    }


}

