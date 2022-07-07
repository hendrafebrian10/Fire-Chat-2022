//
//  ConversationsController.swift
//  Fire Chat 2022
//
//  Created by hendra febrian on 06/07/22.
//

import UIKit
import Firebase


private let reuseIdentifier = "ComversationCell"

class ConversationController: UIViewController {
    
    // Properties
    
    private let tableView = UITableView ()
    
    // Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        autenticateUser()
        
      
    }
    
    // Selectors
    @objc func showProfil(){
         logout()
    }
    
    // API
    
    func autenticateUser(){
        if Auth.auth().currentUser?.uid == nil {
            presentLoginScreen()
        } else {
            print("DEBUG: User is logged in. Configure controller")
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            presentLoginScreen()
        } catch {
            print("DEBUG: Error sign out")
        }
    }
    
    // Helpers
    
    func presentLoginScreen() {
        DispatchQueue.main.async {
            let controller = LoginController()
            let nav = UINavigationController (rootViewController: controller)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true, completion: nil)
        }
    }
    
    
    func configureUI () {
        view.backgroundColor = .white
        configureNavigationBar()
        configureTableView()
        
        
        let image = UIImage(systemName: "person.circle.fill")
        navigationItem.leftBarButtonItem = UIBarButtonItem (image: image, style: .plain, target: self, action: #selector(showProfil))
    }
    
    func configureTableView(){
        tableView.backgroundColor = .white
        tableView.rowHeight = 80
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.frame = view.frame
        
     
    }
    
    
    func configureNavigationBar(){
        let apperance = UINavigationBarAppearance()
        apperance.configureWithOpaqueBackground()
        apperance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        apperance.backgroundColor = .systemMint
        
        navigationController?.navigationBar.standardAppearance = apperance
        navigationController?.navigationBar.compactAppearance = apperance
        navigationController?.navigationBar.scrollEdgeAppearance = apperance
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Messages"
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = true
        
        navigationController?.navigationBar.overrideUserInterfaceStyle = .dark
    }
    
    
}

extension ConversationController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = "Test Cell"
        return cell
    }
    
    
}

extension ConversationController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
