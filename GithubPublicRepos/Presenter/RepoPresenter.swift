//
//  RepoPresenter.swift
//  GithubPublicRepos
//
//  Created by Mohamed Elsayeh on 8/19/18.
//  Copyright © 2018 Mohamed Elsayeh. All rights reserved.
//

import UIKit
import SwiftyJSON
import ObjectMapper

class RepoPresenter: BasePresenter {
    func saveRepos(repos: [Repo], update: Bool) {
        DBManager.shared.saveRepos(repos: repos, update: update)
    }
    
    func getReposForAccount(account: String, success: @escaping ([Repo]) -> Void, failure: @escaping (Error) -> Void) {
        let request = GPRequest(url: "https://api.github.com/users/\(account)/repos", method: .get)
        NetworkManager.sharedManager.performRequest(request: request, successBlock: { (jsonArray) -> (Void) in
            let repos = Mapper<Repo>().mapArray(JSONArray: jsonArray.arrayObject as! [[String : Any]])
            self.saveRepos(repos: repos, update: true)
            success(repos)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func loadReposForAccount(account: String) -> [Repo] {
        return DBManager.shared.getRepos().sorted(by: { (obj1, obj2) -> Bool in
            obj1.id.value! < obj2.id.value!
        })
    }
    
    func deleteRepo(repo: Repo) {
        return DBManager.shared.deleteRepo(repo: repo)
    }
}
