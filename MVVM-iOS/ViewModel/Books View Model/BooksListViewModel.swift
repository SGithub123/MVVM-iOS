//
//  File.swift
//  MVVM-iOS
//
//  Created by Sanket Bhamare on 09/10/21.
//

import Foundation

struct BooksListViewModel {
    var booksLVMResult : [BooksResult]
}

extension BooksListViewModel {
    
    func numberOfRows(_ section:Int) -> Int {
        return booksLVMResult.count
    }
    
    func bookAtIndex(_ index:Int) -> BooksViewModel {
        let bookResult = booksLVMResult[index]
        return BooksViewModel(bookResult)
    }
}

struct BooksViewModel {
    private var booksVMResult : BooksResult
}

extension BooksViewModel {
    init(_ bookResult: BooksResult) {
        self.booksVMResult = bookResult
    }
}

extension BooksViewModel {
    
    var title : String {
        return booksVMResult.title ?? ""
    }
    
    var languages : [String] {
        return booksVMResult.languages!
    }
    
}
