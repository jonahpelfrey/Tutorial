//
//  HomeViewController.swift
//  Tutorial
//
//  Created by Jonah Pelfrey on 6/10/20.
//  Copyright © 2020 Jonah Pelfrey. All rights reserved.
//

import UIKit
import Combine

class FeaturedViewController: UIViewController, HasCustomView {
    typealias CustomView = FeaturedView
    var coordinator: FeaturedFlow?
    
    private var viewModel = FeaturedViewModel()
    private var dataSource: UICollectionViewDiffableDataSource<Section, Feature>!
    private var cancellables: Set<AnyCancellable> = []
    
    override func loadView() {
        let customView = FeaturedView()
        view = customView
    }
    
    override func viewDidLoad() {
        configureDelegates()
        configureDataSource()
        configureSubscriptions()
    }
}

extension FeaturedViewController {
    private func configureDelegates() {
        customView.collectionView.register(FeaturedCell.self, forCellWithReuseIdentifier: FeaturedCell.reuseIdentifier)
        customView.collectionView.delegate = self
    }
    
    private func configureDataSource() {
        self.dataSource = UICollectionViewDiffableDataSource<Section, Feature>(collectionView: customView.collectionView)
        { (collectionView, indexPath, feature) -> UICollectionViewCell? in
            guard let cell = self.customView.collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedCell.reuseIdentifier, for: indexPath) as? FeaturedCell else { fatalError("Cell not registered with collection view")
            }
            
            return cell
        }
    }
    
    private func configureSubscriptions() {
        viewModel.features
            .receive(on: RunLoop.main)
            .sink { [weak self] (features) in
                var snapshot = NSDiffableDataSourceSnapshot<Section, Feature>()
                snapshot.appendSections([.main])
                snapshot.appendItems(features)
                self?.dataSource.apply(snapshot, animatingDifferences: true)
        }.store(in: &cancellables)
    }
}

extension FeaturedViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = dataSource.itemIdentifier(for: indexPath) else { return }
        collectionView.deselectItem(at: indexPath, animated: true)
        // navigate somewhere
    }
}
