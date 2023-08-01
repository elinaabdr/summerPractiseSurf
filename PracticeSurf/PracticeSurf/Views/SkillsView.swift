//
//  SkillsView.swift
//  PracticeSurf
//
//  Created by Элина Абдрахманова on 01.08.2023.
//

import UIKit

protocol SkillsViewDelegate: AnyObject {
    func addSkill(skill: String)
    func removeSkill()
    func presentAddSkillAlert()
}

class SkillsView: UIView, SkillsCollectionViewDelegate {
    func deleteSkill(at indexPath: IndexPath) {
        skillsCollectionView.deleteSkill(at: indexPath)
    }
    
    func addSkill(skill: String) {
        skillsCollectionView.addSkill(skill: skill)
    }
    
    func removeSkill() {
        skillsCollectionView.removeSkill()
    }
    
    weak var delegate: SkillsViewDelegate?
    
    private let skillsLabel = UILabel(text: "Мои навыки",
                                      font: .systemFontMedium16(),
                                      textColor: .black,
                                      alignment: .left,
                                      numberOfLines: 1)
    
    private lazy var editButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setBackgroundImage(UIImage(named: "editButton"), for: .normal)
        btn.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        btn.isUserInteractionEnabled = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var editMode = false
    
    lazy var skillsCollectionView: SkillsCollectionView = {
            let collectionView = SkillsCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.skillsDelegate = self
            return collectionView
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(skillsLabel)
        addSubview(editButton)
        addSubview(skillsCollectionView)
    }
    
    
    @objc private func editButtonTapped() {
        editMode.toggle()
        
        if editMode {
            delegate?.presentAddSkillAlert()
            editButton.setBackgroundImage(UIImage(named: "checkButton"), for: .normal)
        } else {
            editButton.setBackgroundImage(UIImage(named: "editButton"), for: .normal)
        }
    }
}


//MARK: - set constraints
extension SkillsView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            skillsLabel.topAnchor.constraint(equalTo: topAnchor),
            skillsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            skillsLabel.trailingAnchor.constraint(equalTo: editButton.leadingAnchor, constant: -20),
            
            editButton.centerYAnchor.constraint(equalTo: skillsLabel.centerYAnchor),
            editButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            skillsCollectionView.topAnchor.constraint(equalTo: skillsLabel.bottomAnchor, constant: 10),
            skillsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            skillsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            skillsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
