//
//  DBManager.swift
//  GithubPublicRepos
//
//  Created by Mohamed Elsayeh on 8/19/18.
//  Copyright © 2018 Mohamed Elsayeh. All rights reserved.
//

import UIKit
import RealmSwift

class DBManager: NSObject {

    let uiRealm = try! Realm()
    
    private override init() { }
    
    static let shared: DBManager = DBManager()
    
    func saveRepos(repos: [Repo]) {
        try! uiRealm.write({
            print("File URL: \(Realm.Configuration.defaultConfiguration.fileURL?.absoluteString ?? "")")
            uiRealm.add(repos, update: true)
        })
    }
    
    func getRepos() -> [Repo] {
        let results = uiRealm.objects(Repo.self)
        return Array(results)
    }
    
    func deleteRepo(repo: Repo) {
        try! uiRealm.write({
            print("Delete repo with ID: \(repo.id.value ?? 0)")
            uiRealm.delete(repo)
        })
    }
}
