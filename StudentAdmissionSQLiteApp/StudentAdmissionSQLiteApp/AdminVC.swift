//
//  AdminVC.swift
//  StudentAdmissionSQLiteApp
//
//  Created by DCS on 16/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class AdminVC: UIViewController {
    
    let adminToken = UserDefaults.standard.string(forKey: "sesionAdmin")
    let adminName = UserDefaults.standard.string(forKey: "admin")
    
    
    private let add:UIButton = {
        let button = UIButton()
        button.setTitle("Add Student", for: .normal)
        button.addTarget(self, action: #selector(addstud), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        button.layer.cornerRadius = 25
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        return button
    }()
    
    private let noticeBoard:UIButton = {
        let button = UIButton()
        button.setTitle("Notice", for: .normal)
        button.addTarget(self, action: #selector(note), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        button.layer.cornerRadius = 25
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }()
    
    private let logout_btn:UIButton = {
        let button = UIButton()
        button.setTitle("Logout", for: .normal)
        button.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        button.backgroundColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
        button.layer.cornerRadius = 25
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        print("now into the admin page")
        view.addSubview(add)
        view.addSubview(noticeBoard)
        view.addSubview(logout_btn)
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "studImg2.jpg")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        add.frame = CGRect(x: 40, y: 300, width: view.width - 80, height: 60)
        noticeBoard.frame = CGRect(x: 40, y: add.bottom + 10,  width: view.width - 80, height: 60)
        logout_btn.frame = CGRect(x: 40, y: noticeBoard.bottom + 10,  width: view.width - 80, height: 60)
    }
    
    @objc private func addstud(){
        let asvc = StudentListVC()
        navigationController?.pushViewController(asvc, animated: true)
    }
    @objc private func note(){
        let nt = NoticeVC()
        navigationController?.pushViewController(nt, animated: true)
    }
    
    @objc private func logoutTapped(){
        print("session clear")
        let lv = ViewController()
        navigationController?.pushViewController(lv, animated: true)
    }
}
