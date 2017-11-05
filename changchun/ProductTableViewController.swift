//
//  ProductTableViewController.swift
//  changchun
//
//  Created by Toan Phan on 11/4/17.
//  Copyright © 2017 Toan Phan. All rights reserved.
//

import UIKit

class Product {
    
    var title:String
    var description:String
    var photo:UIImage
    
    init(_ title:String, _ desc:String, _ photo: UIImage) {
        self.title = title
        self.description = desc
        self.photo = photo
    }
    
    func getTitle() -> String {
        return title
    }
    
    func getDescription() -> String {
        return description
    }
    
    func getPhoto() -> UIImage {
        return photo
    }
    
}

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        avatar.layer.cornerRadius = avatar.frame.size.width/2
        avatar.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

class ProductTableViewController: UITableViewController {
    let productId = "productId"
    var products = [Product]()

    func generateProduct() -> [Product] {
        var products = [Product]()
        for i in 2...5 {
            let photo = getImageFromURL(url: "https://chanchun.github.io/images/photos/\(i).jpg")
            let pro = Product("pro\(i)", "descsription \(i)", photo!)
            products.append(pro)
        }
        return products
    }
    
    func getImageFromURL(url:String) -> UIImage? {
        let urlImg = URL(string: url)
        let data = try? Data(contentsOf: urlImg!)
        if let imageData = data {
            let image = UIImage(data: imageData)
            return image!
        }
        return nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.products = generateProduct()
//        tableView.register(CustomCell.self, forCellReuseIdentifier: productId)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return products.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: productId, for: indexPath) as? CustomTableViewCell
        cell?.title.text = products[indexPath.row].getTitle()
        cell?.avatar.image = products[indexPath.row].getPhoto()
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    
}
