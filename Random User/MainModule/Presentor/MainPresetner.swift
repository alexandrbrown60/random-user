//
//  MainPresetner.swift
//  Random User
//
//  Created by Александр Иванов on 20.03.2022.
//

import Foundation

protocol MainViewProtocol: class {
    func setPerson(_ person: Person)
}

protocol MainViewPresenterProtocol: class {
    init(view: MainViewProtocol, person: Person)
    func showPerson()
}

class MainPresenter: MainViewPresenterProtocol {
    let view: MainViewProtocol
    let person: Person
    
    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showPerson() {
        print("Показываю юзера")
    }
}

