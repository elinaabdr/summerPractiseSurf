//
//  ViewController.swift
//  PracticeSurf
//
//  Created by Элина Абдрахманова on 01.08.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileView = ProfileView()
    private let skillsView = SkillsView()
    private let aboutView = AboutView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setContraints()
        
        skillsView.delegate = self
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(profileView)
        view.addSubview(skillsView)
        view.addSubview(aboutView)
    }
}

//MARK: - SkillsViewDelegate
extension ProfileViewController: SkillsViewDelegate {
    
    func removeSkill() {
        skillsView.skillsCollectionView.removeSkill()
    }
    
    func addSkill(skill: String) {
        skillsView.skillsCollectionView.addSkill(skill: skill)
    }
    
    func presentAddSkillAlert() {
        let alertController = UIAlertController(title: "Добавление навыка",
                                                message: "Введите название навыка которым вы владеете",
                                                preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "Введите название"
        }
        
        let addAction = UIAlertAction(title: "Добавить", style: .default) { [weak self] _ in
            if let skill = alertController.textFields?.first?.text, !skill.isEmpty {
                self?.skillsView.skillsCollectionView.addSkill(skill: skill)
            }
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

//MARK: - set contraints
extension ProfileViewController {
    private func setContraints( ){
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: view.topAnchor),
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            skillsView.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 20),
            skillsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            skillsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            skillsView.heightAnchor.constraint(equalToConstant: 180),
            
            aboutView.topAnchor.constraint(equalTo: skillsView.bottomAnchor, constant: 10),
            aboutView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            aboutView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}
