//
//  WriteView.swift
//  DDAK
//
//  Created by taekki on 2022/08/22.
//

import UIKit

import DDAK_Core
import SnapKit
import Then

final class WriteView: BaseView {
    
    lazy var maskingTapeImageView = UIImageView()
    lazy var containerImageView = UIImageView()
    lazy var photoImageView = UIImageView()
    lazy var titleTextField = UITextField()
    lazy var contentTextView = UITextView()
    lazy var buttonHStackView = UIStackView(arrangedSubviews: [selectPhotoButton, colorButton])
    lazy var selectPhotoButton = UIButton()
    lazy var colorButton = UIButton()
    
    override func configureAttributes() {
        self.backgroundColor = .systemBackground
        
        containerImageView.do {
            $0.backgroundColor = .white
            $0.layer.shadowColor = UIColor.black.cgColor
            $0.layer.shadowOpacity = 0.5
            $0.layer.shadowRadius = 10
            $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        }
        
        maskingTapeImageView.do {
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
            $0.image = UIImage(named: "img_tape1")
        }
        
        photoImageView.do {
            $0.backgroundColor = .systemGray6
        }
        
        titleTextField.do {
            $0.font = .boldSystemFont(ofSize: 16)
            $0.placeholder = " 사진의 이름을 기록해봐요."
        }
        
        contentTextView.do {
            $0.text = "간단하게 설명을 남겨주세요."
            $0.textColor = .systemGray
        }
        
        buttonHStackView.do {
            $0.axis = .horizontal
            $0.spacing = 10
        }
        
        selectPhotoButton.do {
            $0.contentMode = .scaleAspectFill
            $0.setBackgroundImage(UIImage(systemName: "photo.circle"), for: .normal)
            $0.tintColor = .darkGray
        }

        colorButton.do {
            $0.contentMode = .scaleAspectFill
            $0.setBackgroundImage(UIImage(systemName: "paintpalette"), for: .normal)
            $0.tintColor = .darkGray
        }
    }
    
    override func configureLayout() {
        
        self.addSubviews(
            containerImageView,
            maskingTapeImageView,
            photoImageView,
            titleTextField,
            contentTextView,
            buttonHStackView
        )

        containerImageView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalToSuperview().multipliedBy(0.5)
            $0.center.equalToSuperview()
        }
        
        maskingTapeImageView.snp.makeConstraints {
            $0.width.equalTo(containerImageView).multipliedBy(0.4)
            $0.height.equalTo(30)
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(containerImageView.snp.top)
        }
        
        photoImageView.snp.makeConstraints {
            $0.height.equalTo(containerImageView).multipliedBy(0.6)
            $0.top.equalTo(containerImageView).inset(20)
            $0.leading.trailing.equalTo(containerImageView).inset(20)
        }

        titleTextField.snp.makeConstraints {
            $0.top.equalTo(photoImageView.snp.bottom).offset(16)
            $0.leading.trailing.equalTo(containerImageView).inset(20)
            $0.height.equalTo(40)
        }
        
        contentTextView.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(16)
            $0.leading.trailing.equalTo(containerImageView).inset(20)
            $0.bottom.equalTo(containerImageView.snp.bottom).inset(16)
        }
        
        buttonHStackView.snp.makeConstraints {
            $0.top.equalTo(containerImageView.snp.bottom).offset(12)
            $0.trailing.equalTo(containerImageView.snp.trailing)
            $0.height.equalTo(40)
        }
        
        selectPhotoButton.snp.makeConstraints {
            $0.width.height.equalTo(40)
        }

        colorButton.snp.makeConstraints {
            $0.width.height.equalTo(40)
        }
    }
}
