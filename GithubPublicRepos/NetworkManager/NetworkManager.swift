//
//  NetworkManager.swift
//  GithubPublicRepos
//
//  Created by Mohamed Elsayeh on 8/19/18.
//  Copyright © 2018 Mohamed Elsayeh. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

final class NetworkManager: NSObject {
    
    private var networkStatus : NetworkStatus = .unknown;
    private let reachabilityManager = Alamofire.NetworkReachabilityManager(host: "www.google.com")
    
    private override init() {
        super.init()
    }
    static let sharedManager = NetworkManager()
    
    func reachabilityStatus(statusCompletion: ((NetworkStatus) -> Void)!) {
        listenForReachability(completion: statusCompletion);
    }
    
    private func listenForReachability(completion: ((NetworkStatus) -> Void)!) {
        reachabilityManager?.listener = { status in
            switch status {
            case .notReachable:
                self.networkStatus = .notConnected
                print("The network is not reachable")
            case .unknown :
                self.networkStatus = .unknown
                print("It is unknown whether the network is reachable")
            case .reachable(.ethernetOrWiFi):
                self.networkStatus = .connected
                print("The network is reachable over the WiFi connection")
            case .reachable(.wwan):
                self.networkStatus = .connected
                print("The network is reachable over the WWAN connection")
            }
            completion(self.networkStatus)
        }
        reachabilityManager?.startListening()
    }
    
    public enum NetworkStatus {
        case unknown
        case notConnected
        case connected
    }
    
    func performRequest(request: GPRequest, successBlock: @escaping (JSON) -> (Void), failureBlock: @escaping (Error) -> (Void)) {
        Alamofire.request(request.url!, method: request.method!).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let jsonObj = JSON(value)
                print("Validation Successful\n\(jsonObj)")
                successBlock(jsonObj)
            case .failure(let error):
                print(error)
                failureBlock(error)
            }
        }
    }
}
