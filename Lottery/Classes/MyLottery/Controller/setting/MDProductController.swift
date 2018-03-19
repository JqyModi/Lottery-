//
//  MDProductController.swift
//  Lottery
//
//  Created by mac on 2018/3/19.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MDProductController: UICollectionViewController {

    var products: NSArray? = {
        var arr = NSArray()
        //解析json
        let path = Bundle.main.path(forResource: "more_project", ofType: "json")
        let data = NSData.init(contentsOfFile: path!)
        do{
            let tempArr: NSArray = try JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
            let mutArr = NSMutableArray()
            for item in tempArr {
                let pro = MDProduct(dict: item as! [String : Any])
                mutArr.add(pro)
            }
            arr = mutArr
        }catch {
            debugPrint(error)
        }
        debugPrint("arr -----> \(arr)")
        return arr
    }()
    
    //重写构造方法方便字符串创建类使用：否则崩溃
    convenience init() {
        debugPrint("init")
        //设置流式布局
        let fl = UICollectionViewFlowLayout()
        fl.minimumLineSpacing = 10
        fl.minimumInteritemSpacing = 0
        fl.itemSize = CGSize(width: 80, height: 80)
        //设置顶部内边距
        fl.sectionInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        self.init(collectionViewLayout: fl)
    }
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        debugPrint("init -- collectionViewLayout")
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView?.backgroundColor = UIColor.init(white: 1, alpha: 0.93)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let nib = UINib(nibName: "ProductCell", bundle: nil)
        self.collectionView?.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        // Do any additional setup after loading the view.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1 //只有一组
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return (products?.count)!
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //注册nib后返回的就是nib类型的Cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MDProductCell
    
        // Configure the cell
        cell.product = self.products?[indexPath.item] as! MDProduct
        
        return cell
    }

    // MARK: UICollectionViewDelegate


}
