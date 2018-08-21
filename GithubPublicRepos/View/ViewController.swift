//
//  ViewController.swift
//  GithubPublicRepos
//
//  Created by Mohamed Elsayeh on 8/19/18.
//  Copyright © 2018 Mohamed Elsayeh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var repos: [Repo] = []
    var username = "moh-elsayeh"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()
        titleLabel.text = "Public repositories for user: \(username)"
        // Do any additional setup after loading the view, typically from a nib.
        reloadSavedRepos()
    }

    override func viewDidAppear(_ animated: Bool) {
        reloadDataFromServer()
    }
    
    func reloadSavedRepos() {
        repos = RepoPresenter().loadReposForAccount(account: username)
    }
    
    func reloadDataFromServer() {
        RepoPresenter().getReposForAccount(account: username, success: { (result) in
            self.repos = result
            self.tableView.reloadData()
        }) { (error) in
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            print("")
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell")!
        (cell.viewWithTag(10) as! UILabel).text = repos[indexPath.row].name
        (cell.viewWithTag(11) as! UILabel).text = "Last update: \(repos[indexPath.row].createdAt ?? "")"
        (cell.viewWithTag(12) as! UILabel).text = "Owner: \(repos[indexPath.row].owner?.login ?? "")"
        (cell.viewWithTag(13) as! UIImageView).image = #imageLiteral(resourceName: "happy")
        if repos[indexPath.row].hasIssues.value ?? false {
            (cell.viewWithTag(13) as! UIImageView).image = #imageLiteral(resourceName: "angry")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            RepoPresenter().deleteRepo(repo: repos[indexPath.row])
            repos.remove(at: indexPath.row)
            tableView.deleteRows(at : [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIApplication.shared.open(URL(string: repos[indexPath.row].htmlURL!)!, options: [:], completionHandler: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

