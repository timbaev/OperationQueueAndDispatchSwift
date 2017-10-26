//
//  NewsRepository.swift
//  VKProfile
//
//  Created by Тимур Шафигуллин on 26.10.17.
//  Copyright © 2017 iOS Lab ITIS. All rights reserved.
//

import Foundation

class NewsRepository: Repository {
    typealias T = News
    var news = [News]()
    
    func syncSave(with news: News) {
        self.news.append(news)
    }
    
    func asyncSave(with news: News, completionBlock: @escaping (Bool) -> ()) {
        let operationQueue = OperationQueue()
        operationQueue.addOperation {
            self.news.append(news)
            completionBlock(true)
        }
    }
    
    func syncGetAll() -> [News] {
        return news
    }
    
    func asyncGetAll(completionBlock: @escaping ([News]) -> ()) {
        let operationQueue = OperationQueue()
        operationQueue.addOperation {
            completionBlock(self.news)
        }
    }
    
    func syncSearch(id: Int) -> News? {
        if let resultNews = news.first(where: { $0.id == id }) {
            return resultNews
        }
        return nil
    }
    
    func asyncSearch(id: Int, completionBlock: @escaping (News?) -> ()) {
        let operationQueue = OperationQueue()
        operationQueue.addOperation {
            if let resultNews = self.news.first(where: { $0.id == id }) {
                completionBlock(resultNews)
            }
            completionBlock(nil)
        }
    }
    
}
