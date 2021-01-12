//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by 정진배 on 2021/01/12.
//

import Foundation

struct ArticleListViewModel {
    let articles: [Article]
}

extension ArticleListViewModel {

    var numberOfSections: Int {
        return 1
    }

    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }

    func articleAtIndex(_ index: Int) -> ArticleViweModel {
        let article = self.articles[index]

        return ArticleViweModel(article)
    }

}

struct ArticleViweModel {
    private let article: Article
}

extension ArticleViweModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViweModel {

    var title: String {
        return self.article.title
    }

    var description: String {
        return self.article.description
    }
}
