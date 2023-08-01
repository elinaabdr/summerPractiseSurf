//
//  ViewController.swift
//  PracticeSurf
//
//  Created by Элина Абдрахманова on 01.08.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let profileView = ProfileView()
    private let skillsView = SkillsView()
    private let aboutView = AboutView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        
        skillsView.delegate = self
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(profileView)
        scrollView.addSubview(skillsView)
        scrollView.addSubview(aboutView)
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

//MARK: - set constraints
extension ProfileViewController {
    private func setConstraints( ){
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            profileView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            profileView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            skillsView.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 20),
            skillsView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            skillsView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            skillsView.heightAnchor.constraint(equalToConstant: 180),
            
            aboutView.topAnchor.constraint(equalTo: skillsView.bottomAnchor, constant: 10),
            aboutView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            aboutView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            aboutView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            aboutView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40)
        ])
    }
}
