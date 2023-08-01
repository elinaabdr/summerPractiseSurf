//
//  SkillsCollectionView.swift
//  PracticeSurf
//
//  Created by Элина Абдрахманова on 01.08.2023.
//

import UIKit

protocol SkillsCollectionViewDelegate: AnyObject {
    
    func deleteSkill(at indexPath: IndexPath)
    func addSkill(skill: String)
    func removeSkill()
    
}

class SkillsCollectionView: UICollectionView, SkillsCollectionViewDelegate {
    
    func removeSkill() {
        Skills.skills.removeLast()
        reloadData()
    }
    
    
    func deleteSkill(at indexPath: IndexPath) {
        Skills.skills.remove(at: indexPath.item)
        reloadData()
    }
    
    func addSkill(skill: String) {
        Skills.skills.append(skill)
        reloadData()
    }
    
    private let collectionLayout = UICollectionViewFlowLayout()
    
    weak var skillsDelegate: SkillsCollectionViewDelegate?

    var editMode: Bool = false {
        didSet {
            reloadData()
        }
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: collectionLayout)
        
        configure()
        register(SkillsCollectionViewCell.self, forCellWithReuseIdentifier: SkillsCollectionViewCell.identifier)
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        
        collectionLayout.itemSize = CGSize(width: 80, height: 40)
    }
    
    private func setDelegates() {
        dataSource = self
        delegate = self
    }
    
    private func remove(at indexPath: IndexPath) {
        deleteItems(at: [indexPath])
    }
}

//MARK: - UICollectionViewDataSource
extension SkillsCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Skills.skills.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SkillsCollectionViewCell.identifier, for: indexPath) as? SkillsCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.contentView.isUserInteractionEnabled = false
        cell.delegate = self
        cell.indexPath = indexPath
        
        let skill = Skills.skills[indexPath.item]
        cell.configure(skill: skill)
        
        return cell
    }
    
    override func deleteItems(at indexPaths: [IndexPath]) {
        guard let indexPath = indexPaths.first else { return }
        skillsDelegate?.deleteSkill(at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {        
        remove(at: indexPath)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension SkillsCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel(frame: CGRect.zero)
        label.text = Skills.skills[indexPath.item]
        label.sizeToFit()
        return CGSize(width: label.frame.width + 20, height: 40)
    }
}
