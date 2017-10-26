//
//  Repository.swift
//  VKProfile
//
//  Created by Тимур Шафигуллин on 26.10.17.
//  Copyright © 2017 iOS Lab ITIS. All rights reserved.
//

import Foundation

protocol Repository {
    associatedtype T
    
    func syncSave(with: T)
    func asyncSave(with: T, completionBlock: @escaping (Bool) -> ())
    func syncGetAll() -> [T]
    func asyncGetAll(completionBlock: @escaping ([T]) -> ())
    func syncSearch(id: Int) -> T?
    func asyncSearch(id: Int, completionBlock: @escaping (T?) -> ())
    
}
