//
//  ProfileView.swift
//  PageControll
//
//  Created by Aydin on 18.05.23.
//

import UIKit

class ProfileView: UICollectionViewCell {

    static let identifier = "ProfileView"

    private lazy var stack: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.distribution = .equalSpacing
        s.alignment = .leading
        s.spacing = 8
//        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()

    private lazy var view1: UIView = {
        let v = UIView()
        v.backgroundColor = .lightGray
        v.layer.cornerRadius = 8
        v.layer.masksToBounds = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private lazy var view2: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .lightGray
        v.layer.cornerRadius = 8
        v.layer.masksToBounds = true
        return v
    }()

    private lazy var view3: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .lightGray
        v.layer.cornerRadius = 8
        v.layer.masksToBounds = true
        return v
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
//        activateConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with text: String, _ name: String) {
        let label = UILabel(frame: CGRect(x: 10, y: Int(contentView.center.y), width: Int(contentView.frame.size.width), height: 20))
        label.text = text
        let label2 = UILabel(frame: CGRect(x: 10, y: Int(contentView.center.y) - 20, width: Int(contentView.frame.size.width), height: 20))
        label2.text = name
//        stack.frame = contentView.frame
//        stack.addArrangedSubview(label2)
//        stack.addArrangedSubview(label)
////        label.center = stack.center
//        contentView.addSubview(stack)
//        label2.center = contentView.center
//        label2.center = CGPoint(x: contentView.center.x, y: contentView.center.y - 20)
        contentView.addSubview(label2)
        contentView.addSubview(label)
    }

    private func activateConstraints() {
        stack.addArrangedSubview(view1)
        stack.addArrangedSubview(view3)
        stack.addArrangedSubview(view2)
        contentView.addSubview(stack)
        stack.frame = contentView.frame
        
        NSLayoutConstraint.activate([

//            stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
//            stack.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
//            stack.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
//            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            view1.widthAnchor.constraint(equalTo: stack.widthAnchor),
            view1.heightAnchor.constraint(equalToConstant: 22),
            view2.widthAnchor.constraint(equalToConstant: 200),
            view2.heightAnchor.constraint(equalToConstant: 22),
            view3.widthAnchor.constraint(equalToConstant: 100),
            view3.heightAnchor.constraint(equalToConstant: 22),
        ])
    }
}

