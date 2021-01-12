//
//  Article.swift
//  GoodNews
//
//  Created by 정진배 on 2021/01/12.
//

import Foundation

struct ArticleList: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let title: String
    let description: String
}
