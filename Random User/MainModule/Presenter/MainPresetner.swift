//
//  MainPresetner.swift
//  Random User
//
//  Created by Александр Иванов on 20.03.2022.
//

import Foundation

//MARK: - Protocols

protocol MainViewProtocol: class {
    func success()
    func failure()
}

protocol MainViewPresenterProtocol: class {
    var person: PersonResult? { get set }
    
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    
    func getPerson()
}

//MARK: - MainPresenter class

class MainPresenter: MainViewPresenterProtocol {
    //Properties
    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol
    var person: PersonResult?
    
    
    //Initialization
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getPerson()
    }
    
    
    //Functions
    func getPerson() {
        ///trigger urlsession and place result to main queue async
        self.networkService.getPerson { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let person):
                    self.person = person
                    self.view?.success()
                case .failure:
                    self.view?.failure()
                }
            }
            
       }
        
    }
}

