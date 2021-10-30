//
//  BookListVC.swift
//  MVVM-iOS
//
//  Created by Sanket Bhamare on 09/10/21.
//

import UIKit
import SwiftyJSON

class BookListVC: UIViewController, XIBed {

    var coordinator : MainCoordinator?
    
    @IBOutlet weak var bookList_Tbl:UITableView!
    
    var bookListVM : BooksListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        bookList_Tbl.register(UINib(nibName: "BookListCell", bundle: nil), forCellReuseIdentifier: "BookListCell")
        
//        callServiceWithURL()
        
        SetupData()
    }
    
    func SetupData() {
        
        // Get data
        getDataFromServer { (success, data) in
            self.bookListVM = BooksListViewModel(booksLVMResult: data!)
            DispatchQueue.main.async {
                self.bookList_Tbl.reloadData()
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
        cell.detail_Lbl.text = "Author: \(book?.author ?? "")"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        coordinator?.BookDetailsPage()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let lbl = UILabel()
        lbl.text = "Books List"
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        let view = UIView()
        view.backgroundColor = .darkGray
        view.addSubview(lbl)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        80.0
    }
    
}

var nameArr = ["Pride and Prejudice","The Adventures of Tom Sawyer","Alice's Adventures in Wonderland","A Tale of Two Cities","The Yellow Wallpaper"]
var authorArr = ["Austen, Jane","Twain, Mark","Carroll, Lewis","Dickens, Charles","Gilman, Charlotte Perkins"]


extension BookListVC {
        
   
    
    private func getDataFromServer( complete: @escaping (_ success: Bool, _ data: [BooksResult]? )->() ){
        DispatchQueue.global().async {
            sleep(2)
            
            var resData: [BooksResult] = [BooksResult]()
            for i in 0 ..< nameArr.count {
                resData.append(BooksResult(name: nameArr[i], author: authorArr[i]))
            }
            complete(true, resData)
            // If server gives an error, use "complete(false, nil)"
        }
    }
    
    
    /*
    //MARK :- Using URL
    func callServiceWithURL() {
        let url = URL(string:"")!
        Webservice().BooksListServiceCall(url: url) { (response) in
            guard let resData = response else { return }
            self.responseData(response: resData)
        }
    }
    
    func responseDataUsingURL(response:BooksModelClass) {
        if let result = response.results {
            self.bookListVM = BooksListViewModel(booksLVMResult: result)
            
            DispatchQueue.main.async {
                self.bookList_Tbl.reloadData()
            }
        }
    }
    */
    
}
