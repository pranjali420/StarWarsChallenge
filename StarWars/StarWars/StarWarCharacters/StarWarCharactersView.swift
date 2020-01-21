//
//  StarWarCharactersView.swift
//  StarWars
//
//  Created by Pranjali Wagh on 28/03/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import UIKit

extension StarWarCharactersAssembler {
    func assemble(with wireframe: StarWarCharactersWireframe) -> StarWarCharactersUI {
        return assemble(with: wireframe, viewType: StarWarCharactersView.self)
    }
}

class StarWarCharactersView: UIViewController {
    @IBOutlet weak var collectioView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    static let CharacterIdentifier = "CharacterCell"
    private var viewModels: [ViewModel] = []
    var profile = [Person]()
  
    private let user: StarWarCharactersUser
    
    required init(_ user: StarWarCharactersUser) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectioView.register(UINib(nibName: "CharacterCell", bundle: .main), forCellWithReuseIdentifier: StarWarCharactersView.CharacterIdentifier)      
        load()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        
        navigationItem.title = "Star Wars"
    }
    
    func showAlertMessage(with message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        
    }

    func load() {
        user.loaded()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK:- StarWarCharactersUI

extension StarWarCharactersView: StarWarCharactersUI {
    func NetworkConnectionAvailable() {
        //
    }
    
    func startLoading() {
        activityIndicator.startAnimating()
    }

    func finishLoading() {
        activityIndicator.stopAnimating()
        activityIndicator.style = .gray
        activityIndicator.hidesWhenStopped = true
    }
    
    func loaded(ViewModel: [ViewModel]) {
        viewModels = ViewModel
        collectioView.reloadData()
    }
    
    func getPersons(persons: [Person]) {
        profile = persons
    }
    
    func NetworkConnectionUnavailable() {
        activityIndicator.startAnimating()
        showAlertMessage(with: "Internet connection is lost try again later")
    }
}

// MARK:- UICollectionViewDataSource

extension StarWarCharactersView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 239)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectioView.dequeueReusableCell(withReuseIdentifier: StarWarCharactersView.CharacterIdentifier, for: indexPath) as? CharacterCell else { return UICollectionViewCell() }
         let viewModel = viewModels[indexPath.row]
            cell.nameLabel.text = viewModel.title
            cell.subtitle.text = viewModel.subtitle
       
        return cell
    }
}

extension StarWarCharactersView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.user.select(index: indexPath.row)
    }
}




