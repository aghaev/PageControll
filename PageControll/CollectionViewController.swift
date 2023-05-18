//
//  CollectionViewController.swift
//  PageControll
//
//  Created by Aydin on 18.05.23.
//

import UIKit

class CollectionViewContentController: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var items: Int = 0
    var name: String = ""
    
    let someLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout { _, _ in
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(150)
            )
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(30)
            )
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .none, top: .fixed(5), trailing: .none, bottom: .fixed(5))
            let section = NSCollectionLayoutSection(group: group)
            return section
            
        }
        return layout
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let collectionView: UICollectionView = UICollectionView(frame: frame, collectionViewLayout: someLayout)
        collectionView.contentSize = CGSize(width: frame.width, height: frame.height)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProfileView.self, forCellWithReuseIdentifier: ProfileView.identifier)
        collectionView.bounces = false
        addSubview(collectionView)
        if items == 50 {
            print("")
        }
        debugPrint("override init(frame: CGRect)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileView.identifier, for: indexPath) as? ProfileView else {
            return UICollectionViewCell()
        }
        cell.configure(with: "Row number is: \(indexPath.row + 1)", name)
        return cell
    }
    
    deinit {
        debugPrint("\(type(of: self)) deinit")
    }
}
