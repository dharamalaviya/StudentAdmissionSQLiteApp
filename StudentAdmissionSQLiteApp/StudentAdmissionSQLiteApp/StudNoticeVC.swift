//
//  StudNoticeVC.swift
//  StudentAdmissionSQLiteApp
//
//  Created by DCS on 16/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class StudNoticeVC: UIViewController {
    
    private var noteArray = [Notice]()
    private let StudTableView = UITableView()
    
    override func viewWillAppear(_ animated: Bool) {
        noteArray = SQLiteNoticeHandler.shared.fetch()
        StudTableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Notice Board"
        self.view.backgroundColor = .white
        view.addSubview(StudTableView)
        setupTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        StudTableView.frame = view.bounds
    }
}
extension StudNoticeVC: UITableViewDataSource,UITableViewDelegate {
    
    private func setupTableView() {
        
        StudTableView.register(UITableViewCell.self, forCellReuseIdentifier: "note")
        StudTableView.delegate = self
        StudTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "note", for: indexPath)
        
        let note = noteArray[indexPath.row]
        cell.textLabel?.text = "\(note.name) \t | \(note.notice)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc  = ViewNoticeVC()
        vc.notice = noteArray[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
