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
    var presenter: MainViewPresenterProtocol!
    
    //MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addButton()
        setupPersonView()
        
        //show alert if user have problems with ethernet
        if !NetworkMonitor.shared.isConnected {
            failure()
        }
    }

    //MARK: - Fuctions
    
    //adding bar button
    private func addButton() {
        let reload = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(self.refreshPerson))
        navigationItem.rightBarButtonItem = reload
    }
    
    //get new person from randomuser api on bar button click
    @objc func refreshPerson() {
            presenter.getPerson()
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

//MARK: - MainViewProtocol extension
extension MainViewController: MainViewProtocol {
    //set person to personVeiw
    func success() {
        if let person = presenter.person?.results[0] {
            mainPersonView.setPerson(person)
        }
        
    }
    
    //if get error show alert
    func failure() {
        let alert = UIAlertController(title: "Error", message: "Something goes wrong. Check your ethernet connection", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        self.present(alert, animated: true, completion: nil)
    }
}

