//
//  ViewController.swift
//  Random User
//
//  Created by Александр Иванов on 20.03.2022.
//

import UIKit

class MainViewController: UIViewController {
    //MARK: - Properties
    private let mainPersonView = MainPersonView()
    
    //MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addButton()
        setupPersonView()
    }

    //MARK: - Fuctions
    
    //adding bar button
    private func addButton() {
        let reload = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(self.refreshPerson))
        navigationItem.rightBarButtonItem = reload
    }
    
    //get new person from randomuser api on bar button click
    @objc func refreshPerson() {
        print("Я обновляюсь")
    }
    
    private func setupPersonView() {
        view.addSubview(mainPersonView)
        
        mainPersonView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainPersonView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainPersonView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainPersonView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainPersonView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

