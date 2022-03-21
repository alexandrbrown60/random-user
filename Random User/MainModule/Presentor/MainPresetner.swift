//
//  MainPresetner.swift
//  Random User
//
//  Created by Александр Иванов on 20.03.2022.
//

import Foundation

protocol MainViewProtocol: class {
    func success()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: class {
    var person: PersonResult? { get set }
    
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    
    func getPerson()
}

class MainPresenter: MainViewPresenterProtocol {
    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol
    var person: PersonResult?
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getPerson()
    }
    
    func getPerson() {
        networkService.getPerson { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let person):
                    self.person = person
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}

