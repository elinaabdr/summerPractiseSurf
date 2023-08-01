//
//  ProfileView.swift
//  PracticeSurf
//
//  Created by Элина Абдрахманова on 01.08.2023.
//

import UIKit

class ProfileView: UIView {
    
    private let profileLabel  = UILabel(text: "Профиль",
                                        font: .systemFontBold16(),
                                        textColor: .black,
                                        alignment: .center,
                                        numberOfLines: 1)
    
    private let profileIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "profileIcon")
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 60
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let profileNameLabel = UILabel(text: "Абдрахманова Элина Ильдаровна",
                                           font: .systemFontBold24(),
                                           textColor: .black,
                                           alignment: .center,
                                           numberOfLines: 2)
    
    private let vacancyLabel = UILabel(text: "Junior IOS-разработчик, опыт менее 1 года",
                                       font: .systemFontRegular14(),
                                       textColor: .gray,
                                       alignment: .center,
                                       numberOfLines: 2)
    
    private let locatonLabel = UILabel(text: "Казань",
                                       font: .systemFontRegular14(),
                                       textColor: .gray,
                                       alignment: .center,
                                       numberOfLines: 1)
    
    private let locationImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "location")
        iv.tintColor = .gray
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var locationStackView = UIStackView()
    
    private lazy var descStackView = UIStackView()
    
    private lazy var profileStackView = UIStackView()
    
    private lazy var stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = #colorLiteral(red: 0.9529408813, green: 0.9529413581, blue: 0.9615501761, alpha: 1)
        translatesAutoresizingMaskIntoConstraints = false
        
        locationStackView = UIStackView(arrangedSubviews: [locationImageView, locatonLabel],
                                        axis: .horizontal,
                                        spacing: 1,
                                        alignment: .center)
        
        descStackView = UIStackView(arrangedSubviews: [vacancyLabel, locationStackView],
                                    axis: .vertical,
                                    spacing: 5,
                                    alignment: .center)
        
        profileStackView = UIStackView(arrangedSubviews: [profileIconImageView,
                                                   profileNameLabel,
                                                   descStackView],
                                axis: .vertical,
                                spacing: 10,
                                alignment: .center)
        
        profileStackView.alignment = .center
        
        stackView = UIStackView(arrangedSubviews: [profileLabel, profileStackView],
                                axis: .vertical,
                                spacing: 30,
                                alignment: .center)

        addSubview(stackView)
    }
}
//MARK: - set constraints
extension ProfileView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            profileIconImageView.widthAnchor.constraint(equalToConstant: 120),
            profileIconImageView.heightAnchor.constraint(equalToConstant: 120),
        ])
    }
}
