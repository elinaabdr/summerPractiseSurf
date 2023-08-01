//
//  SkillsCollectionViewCell.swift
//  PracticeSurf
//
//  Created by Элина Абдрахманова on 01.08.2023.
//

import UIKit

class SkillsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SkillsCell"
    
    weak var delegate: SkillsCollectionViewDelegate?
    
    var indexPath: IndexPath?
    
    var skillLabel = UILabel(font: .systemFontRegular14(),
                             textColor: .black,
                             alignment: .center,
                             numberOfLines: 1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
    }
    
    private func setupViews() {
        contentView.backgroundColor = #colorLiteral(red: 0.9529408813, green: 0.9529414773, blue: 0.9658513665, alpha: 1)
        
        contentView.addSubview(skillLabel)
        
        
    }
    
    func configure(skill: String) {
        skillLabel.text = skill
    }
    
    @objc private func deleteButtonTapped() {
           guard let indexPath = indexPath else { return }
           delegate?.deleteSkill(at: indexPath)
       }
}


//MARK: - set contraints
extension SkillsCollectionViewCell {
    private func setContraints() {
        NSLayoutConstraint.activate([
            skillLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            skillLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
