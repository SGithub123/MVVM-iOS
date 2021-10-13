//
//  BookListVC.swift
//  MVVM-iOS
//
//  Created by Sanket Bhamare on 09/10/21.
//

import UIKit

class BookListVC: UIViewController, XIBed {

    var coordinator : MainCoordinator?
    
    @IBOutlet weak var bookList_Tbl:UITableView!
    
    var bookListVM : BooksListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        bookList_Tbl.register(UINib(nibName: "BookListCell", bundle: nil), forCellReuseIdentifier: "BookListCell")
        
        setup()
    }
    
    func setup() {
        
        let url = URL(string:"http://skunkworks.ignitesol.com:8000/books")!
        Webservice().BooksListServiceCall(url: url) { (response) in
            guard let resData = response else { return }
            print(resData)
            if let result = resData.results {
                self.bookListVM = BooksListViewModel(booksLVMResult: result)
                
                DispatchQueue.main.async {
                    self.bookList_Tbl.reloadData()
                }
            }
        }
    }
}

extension BookListVC: UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return bookListVM?.booksLVMResult.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = bookList_Tbl.dequeueReusableCell(withIdentifier: "BookListCell", for: indexPath) as! BookListCell
        
        let book = self.bookListVM?.bookAtIndex(indexPath.row)
        
        cell.title_Lbl.text = "Book Name: \(book?.title ?? "")"
        cell.detail_Lbl.text = "Language: \(book?.languages[0] ?? "")"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        coordinator?.BookDetailsPage()
    }
}

