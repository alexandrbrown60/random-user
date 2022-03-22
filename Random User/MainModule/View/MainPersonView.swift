//
//  MainPersonView.swift
//  Random User
//
//  Created by Александр Иванов on 20.03.2022.
//

import UIKit

final class MainPersonView: UIView {
    //MARK: - Properties
    private var person: Person? {
        didSet {
            if let person = person {
                fullNameLabel.text = person.name.first + " " + person.name.last
                genderLabel.text = person.gender
                locationLabel.text = person.location.country + ", " + person.location.city + ", " + person.location.street.name + " " + String(person.location.street.number)
                emailLabel.text = person.email
                phoneLabel.text = person.phone
            }
            
            
        }
    }
    private let profileImageView = UIImageView()
    private let leftSpacerView = UIView()
    private let rightSpacerView = UIView()
    
    private let fullNameLabel = UILabel()
    
    private let genderLabel = UILabel()
    private let locationLabel = UILabel()
    private let emailLabel = UILabel()
    private let phoneLabel = UILabel()
    
    private lazy var profileImageStackView = UIStackView(arrangedSubviews: [leftSpacerView, profileImageView, rightSpacerView])
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileImageStackView, fullNameLabel, genderLabel, locationLabel, emailLabel, phoneLabel])
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 15
        return stackView
    }()
    
    
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupMainStackView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Functions
    //public function for inject person
    func setPerson(_ person: Person) {
        self.person = person
        setPersonImage()
    }
    
    //get imageUrl data and plae it to person avatar
    private func setPersonImage() {
        DispatchQueue.global().async {
            
            guard let pictureUrl = self.person?.picture.large else {
                return
            }
            
            let url = URL(string: pictureUrl)
            if let data = try? Data(contentsOf: url!) {
                DispatchQueue.main.async {
                    self.profileImageView.image = UIImage(data: data)
                }
            }
        }
    }
    
    private func setupMainStackView() {
        addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainStackView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 20),
            mainStackView.leadingAnchor.constraint(lessThanOrEqualTo: leadingAnchor, constant: 500),
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            profileImageView.widthAnchor.constraint(equalToConstant: 120),
            profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor),
            
            leftSpacerView.widthAnchor.constraint(equalTo: rightSpacerView.widthAnchor)
        ])
        
        
    }
}

