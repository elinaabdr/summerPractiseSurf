//
//  AboutView.swift
//  PracticeSurf
//
//  Created by Элина Абдрахманова on 01.08.2023.
//

import UIKit

class AboutView: UIView {

    private let aboutLabel = UILabel(text: "О себе",
                                      font: .systemFontMedium16(),
                                      textColor: .black,
                                     alignment: .left,
                                     numberOfLines: 1)

    private let descLabel = UILabel(text: "Hard-working, creative and proactive. Specialised in Programming and Analysis. Ambitious, eager to keep growing and evolving in my profession. Constantly developing new skills and abilities.",
                                    font: .systemFontRegular14(),
                                    textColor: .black,
                                    alignment: .left,
                                    numberOfLines: 0)

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
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false

        descLabel.numberOfLines = 0

        stackView = UIStackView(arrangedSubviews: [aboutLabel, UIView.init(), descLabel],
                                axis: .vertical,
                                spacing: 5,
                                alignment: .leading)

        addSubview(stackView)
    }
}

//MARK: - set constraints
extension AboutView {

    private func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}





