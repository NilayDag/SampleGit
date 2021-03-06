//
//  APIClient.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 18.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation
import Alamofire

protocol APIClientInterface {

    typealias OnSuccess<T: Decodable> = ((WSResponse<T>) -> Void)

    func searchRepositories(with searchKeywordQuery: String,
                            _ perPage: Int,
                            _ pageNumber: Int,
                            onSuccess: @escaping OnSuccess<RepositoryList>)
    func getUserDetail(with userName: String, onSuccess: @escaping OnSuccess<UserDetail>)
    func getUserRepos(with userName: String,
                      _ perPage: Int,
                      _ pageNumber: Int,
                      onSuccess: @escaping OnSuccess<[Repository]>)
}

class APIClient: APIClientInterface {
    func searchRepositories(with searchKeywordQuery: String,
                            _ perPage: Int,
                            _ pageNumber: Int,
                            onSuccess: @escaping OnSuccess<RepositoryList>) {
        APIProvider.shared.performRequest(route: .searchRepositories(searchKeywordQuery, perPage, pageNumber),
                                          onSuccess: onSuccess)
    }

    func getUserDetail(with userName: String, onSuccess: @escaping OnSuccess<UserDetail>) {
        APIProvider.shared.performRequest(route: .getUserDetail(userName),
                                          onSuccess: onSuccess)
    }

    func getUserRepos(with userName: String,
                      _ perPage: Int,
                      _ pageNumber: Int,
                      onSuccess: @escaping OnSuccess<[Repository]>) {
        APIProvider.shared.performRequest(route: .getUserRepos(userName, perPage, pageNumber),
                                          onSuccess: onSuccess)
    }
}
