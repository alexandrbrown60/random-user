//
//  ViewController.swift
//  Random User
//
//  Created by Александр Иванов on 20.03.2022.
//

import UIKit

class MainViewController: UIViewController {
    //MARK: - Properties

    
    //MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        addButton()
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
}

