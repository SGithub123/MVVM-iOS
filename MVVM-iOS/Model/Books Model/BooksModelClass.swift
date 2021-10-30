//
//  ModelClass.swift
//  MVVM-iOS
//
//  Created by Sanket Bhamare on 07/10/21.
//

import Foundation

struct BooksModelClass : Codable {
    
    let result : [BooksResult]?
    
}

struct BooksResult : Codable {
    let name: String?
    let author: String?
    
    
    init(name:String,author:String) {
        self.name = name
        self.author = author
    }
}

