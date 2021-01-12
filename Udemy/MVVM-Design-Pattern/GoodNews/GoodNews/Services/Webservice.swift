//
//  Webservice.swift
//  GoodNews
//
//  Created by 정진배 on 2021/01/12.
//

import Foundation

class Webservice {

    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error is \(error.localizedDescription)")
                completion(nil)
            }

            guard let data = data else { return }

            let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)

            if let articleList = articleList {
                completion(articleList.articles)
            }

        }.resume()
    }
}
