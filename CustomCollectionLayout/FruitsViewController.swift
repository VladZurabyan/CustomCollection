import UIKit

class FruitsViewController: UICollectionViewController {
   
    private enum PresentationStyle: String, CaseIterable {
        case table
        case defaultGrid
        case customGrid
        
        var buttonImage: UIImage {
            switch self {
            case .table: return #imageLiteral(resourceName: "table")
            case .defaultGrid: return #imageLiteral(resourceName: "default_grid")
            case .customGrid: return #imageLiteral(resourceName: "custom_grid")
            }
        }
    }
   
    private var selectedStyle: PresentationStyle = .table {
        didSet { updatePresentationStyle() }
    }
    private var styleDelegates: [PresentationStyle: CollectionViewSelectableItemDelegate] = {
        let result: [PresentationStyle: CollectionViewSelectableItemDelegate] = [
            .table: TabledContentCollectionViewDelegate(),
            .defaultGrid: DefaultGriddedContentCollectionViewDelegate(),
            .customGrid: CustomGriddedContentCollectionViewDelegate(),
        ]
        
        result.values.forEach { (delegate) in
            delegate.didSelectItem = { indexPath in
                let parentViewController = delegate.viewControlller as? FruitsViewController
                parentViewController?.openDetailsViewController(at: indexPath)
            }
        }
        
        return result
    }()
    
    private var datasource: [Fruit] = FruitsProvider.get()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(FruitCollectionViewCell.nib,
                                     forCellWithReuseIdentifier: FruitCollectionViewCell.reuseID)
        collectionView.contentInset = .zero
        updatePresentationStyle()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: selectedStyle.buttonImage, style: .plain, target: self, action: #selector(changeContentLayout))
    }
    
    private func updatePresentationStyle() {
        let delegate = styleDelegates[selectedStyle] as? DefaultCollectionViewDelegate
        delegate?.viewControlller = self
        collectionView.delegate = delegate
        collectionView.performBatchUpdates({
            collectionView.reloadData()
        }, completion: nil)
        
        navigationItem.rightBarButtonItem?.image = selectedStyle.buttonImage
    }
    
    private func openDetailsViewController(at indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "secondVC") as! ViewController
        vc.model = datasource[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func changeContentLayout() {
        let allCases = PresentationStyle.allCases
        guard let index = allCases.firstIndex(of: selectedStyle) else { return }
        let nextIndex = (index + 1) % allCases.count
        selectedStyle = allCases[nextIndex]
        
    }
}

// MARK: UICollectionViewDataSource & UICollectionViewDelegate
extension FruitsViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FruitCollectionViewCell.reuseID,
                                                            for: indexPath) as? FruitCollectionViewCell else {
                                                                fatalError("Wrong cell")
        }
        let fruit = datasource[indexPath.item]
        cell.update(title: fruit.name!, image: fruit.icon!)
        return cell
    }
}
