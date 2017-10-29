//
//  NewsRepository.swift
//  VKProfile
//
//  Created by Тимур Шафигуллин on 26.10.17.
//  Copyright © 2017 iOS Lab ITIS. All rights reserved.
//

import Foundation

class NewsRepository: Repository {
    static let instance = NewsRepository()
    
    typealias T = News
    private var news = [Int : News]()
    var currentID = 1
    
    func syncSave(with news: News) {
        self.news[currentID] = news
        currentID += 1
    }
    
    func asyncSave(with news: News, completionBlock: @escaping (Bool) -> ()) {
        let operationQueue = OperationQueue()
        operationQueue.addOperation { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.news[strongSelf.currentID] = news
            strongSelf.currentID += 1
            completionBlock(true)
        }
    }
    
    func syncGetAll() -> [News] {
        let sortedNews = news.sorted(by: { $0.0 < $1.0 })
        var newsArray = [News]()
        sortedNews.forEach { newsArray.append($0.value) }
        return newsArray
    }
    
    func asyncGetAll(completionBlock: @escaping ([News]) -> ()) {
        let operationQueue = OperationQueue()
        operationQueue.addOperation { [weak self] in
            guard let strongSelf = self else { return }
            let newsResult = strongSelf.syncGetAll()
            completionBlock(newsResult)
        }
    }
    
    func syncSearch(id: Int) -> News? {
        if let resultNews = news[id] {
            return resultNews
        }
        return nil
    }
    
    func asyncSearch(id: Int, completionBlock: @escaping (News?) -> ()) {
        let operationQueue = OperationQueue()
        operationQueue.addOperation { [weak self] in
            guard let strongSelf = self else { return }
            if let resultNews = strongSelf.news[id] {
                completionBlock(resultNews)
            }
            completionBlock(nil)
        }
    }
    
}
