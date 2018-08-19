//
//  Repo.swift
//  GithubPublicRepos
//
//  Created by Mohamed Elsayeh on 8/19/18.
//  Copyright © 2018 Mohamed Elsayeh. All rights reserved.
//

import UIKit
import RealmSwift
import ObjectMapper
import Realm

// To parse the JSON, add this file to your project and do:
//
//   let repo = try? newJSONDecoder().decode(Repo.self, from: jsonData)

typealias Repo = RepoElement

class RepoElement: Object {
    required convenience init?(map: Map) {
        self.init()
    }
    
    let id = RealmOptional<Int>()
    @objc dynamic var nodeID, name, fullName: String?
    @objc dynamic var owner: Owner?
    var repoPrivate: Bool?
    @objc dynamic var htmlURL: String?
    @objc dynamic var desc: String?
    var fork: Bool?
    @objc dynamic var url, forksURL, keysURL, collaboratorsURL: String?
    @objc dynamic var teamsURL, hooksURL, issueEventsURL, eventsURL: String?
    @objc dynamic var assigneesURL, branchesURL, tagsURL, blobsURL: String?
    @objc dynamic var gitTagsURL, gitRefsURL, treesURL, statusesURL: String?
    @objc dynamic var languagesURL, stargazersURL, contributorsURL, subscribersURL: String?
    @objc dynamic var subscriptionURL, commitsURL, gitCommitsURL, commentsURL: String?
    @objc dynamic var issueCommentURL, contentsURL, compareURL, mergesURL: String?
    @objc dynamic var archiveURL, downloadsURL, issuesURL, pullsURL: String?
    @objc dynamic var milestonesURL, notificationsURL, labelsURL, releasesURL: String?
    @objc dynamic var deploymentsURL: String?
    @objc dynamic var createdAt, updatedAt, pushedAt: String?
    @objc dynamic var gitURL, sshURL, cloneURL, svnURL: String?
    @objc dynamic var homepage: String?
    let size = RealmOptional<Int>()
    let stargazersCount = RealmOptional<Int>()
    let watchersCount = RealmOptional<Int>()
    let forksCount = RealmOptional<Int>()
    @objc dynamic var language: String?
    let hasIssues = RealmOptional<Bool>()
    let hasProjects = RealmOptional<Bool>()
    let hasDownloads = RealmOptional<Bool>()
    let hasWiki = RealmOptional<Bool>()
    let hasPages = RealmOptional<Bool>()
    let archived = RealmOptional<Bool>()
    @objc dynamic var mirrorURL: String?
    let openIssuesCount = RealmOptional<Int>()
    @objc dynamic var license: License?
    let forks = RealmOptional<Int>()
    let openIssues = RealmOptional<Int>()
    let watchers = RealmOptional<Int>()
    @objc dynamic var defaultBranch: String?
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class License: Object {
    required convenience init?(map: Map) {
        self.init()
    }
    
    @objc dynamic var key, name: String?
    @objc dynamic var spdxID, url: String?
    @objc dynamic var nodeID: String?
}

class Owner: Object {
    required convenience init?(map: Map) {
        self.init()
    }
    
    @objc dynamic var login: String?
    let id = RealmOptional<Int>()
    @objc dynamic var nodeID: String?
    @objc dynamic var avatarURL: String?
    @objc dynamic var gravatarID: String?
    @objc dynamic var url: String?
    @objc dynamic var htmlURL: String?
    @objc dynamic var followersURL: String?
    @objc dynamic var followingURL: String?
    @objc dynamic var gistsURL: String?
    @objc dynamic var starredURL: String?
    @objc dynamic var subscriptionsURL: String?
    @objc dynamic var organizationsURL: String?
    @objc dynamic var reposURL: String?
    @objc dynamic var eventsURL: String?
    @objc dynamic var receivedEventsURL: String?
    @objc dynamic var type: String?
    let siteAdmin = RealmOptional<Bool>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

extension RepoElement: Mappable {
    func mapping(map: Map) {
        id.value                    <- map["id"]
        nodeID                      <- map["node_id"]
        name                        <- map["name"]
        fullName                    <- map["full_name"]
        owner                       <- map["owner"]
        repoPrivate                 <- map["private"]
        htmlURL                     <- map["html_url"]
        desc                        <- map["description"]
        fork                        <- map["fork"]
        url                         <- map["url"]
        forksURL                    <- map["forks_url"]
        keysURL                     <- map["keys_url"]
        collaboratorsURL            <- map["collaborators_url"]
        teamsURL                    <- map["teams_url"]
        hooksURL                    <- map["hooks_url"]
        issueEventsURL              <- map["issue_events_url"]
        eventsURL                   <- map["events_url"]
        assigneesURL                <- map["assignees_url"]
        branchesURL                 <- map["branches_url"]
        tagsURL                     <- map["tags_url"]
        blobsURL                    <- map["blobs_url"]
        gitTagsURL                  <- map["git_tags_url"]
        gitRefsURL                  <- map["git_refs_url"]
        treesURL                    <- map["trees_url"]
        statusesURL                 <- map["statuses_url"]
        languagesURL                <- map["languages_url"]
        stargazersURL               <- map["stargazers_url"]
        contributorsURL             <- map["contributors_url"]
        subscribersURL              <- map["subscribers_url"]
        subscriptionURL             <- map["subscription_url"]
        commitsURL                  <- map["commits_url"]
        gitCommitsURL               <- map["git_commits_url"]
        commentsURL                 <- map["comments_url"]
        issueCommentURL             <- map["issue_comment_url"]
        contentsURL                 <- map["contents_url"]
        compareURL                  <- map["compare_url"]
        mergesURL                   <- map["merges_url"]
        archiveURL                  <- map["archive_url"]
        downloadsURL                <- map["downloads_url"]
        issuesURL                   <- map["issues_url"]
        pullsURL                    <- map["pulls_url"]
        milestonesURL               <- map["milestones_url"]
        notificationsURL            <- map["notifications_url"]
        labelsURL                   <- map["labels_url"]
        releasesURL                 <- map["releases_url"]
        deploymentsURL              <- map["deployments_url"]
        createdAt                   <- map["created_at"]
        updatedAt                   <- map["updated_at"]
        pushedAt                    <- map["pushed_at"]
        gitURL                      <- map["git_url"]
        sshURL                      <- map["ssh_url"]
        cloneURL                    <- map["clone_url"]
        svnURL                      <- map["svn_url"]
        homepage                    <- map["homepage"]
        size.value                  <- map["size"]
        stargazersCount.value       <- map["stargazers_count"]
        watchersCount.value         <- map["watchers_count"]
        language                    <- map["language"]
        hasIssues.value             <- map["has_issues"]
        hasProjects.value           <- map["has_projects"]
        hasDownloads.value          <- map["has_downloads"]
        hasWiki.value               <- map["has_wiki"]
        hasPages.value              <- map["has_pages"]
        forksCount.value            <- map["forks_count"]
        mirrorURL                   <- map["mirror_url"]
        archived.value              <- map["archived"]
        openIssuesCount.value       <- map["open_issues_count"]
        license                     <- map["license"]
        forks.value                 <- map["forks"]
        openIssues.value            <- map["open_issues"]
        watchers.value              <- map["watchers"]
        defaultBranch               <- map["default_branch"]
    }
}

extension License: Mappable {
    func mapping(map: Map) {
        key                         <- map["key"]
        name                        <- map["name"]
        spdxID                      <- map["spdx_id"]
        url                         <- map["url"]
        nodeID                      <- map["node_id"]
    }
}

extension Owner: Mappable {
    func mapping(map: Map) {
        login                       <- map["login"]
        id.value                    <- map["id"]
        nodeID                      <- map["node_id"]
        avatarURL                   <- map["avatar_url"]
        gravatarID                  <- map["gravatar_id"]
        url                         <- map["url"]
        htmlURL                     <- map["html_url"]
        followersURL                <- map["followers_url"]
        followingURL                <- map["following_url"]
        gistsURL                    <- map["gists_url"]
        starredURL                  <- map["starred_url"]
        subscriptionsURL            <- map["subscriptions_url"]
        organizationsURL            <- map["organizations_url"]
        reposURL                    <- map["repos_url"]
        eventsURL                   <- map["events_url"]
        receivedEventsURL           <- map["received_events_url"]
        type                        <- map["type"]
        siteAdmin.value             <- map["site_admin"]
    }
}
