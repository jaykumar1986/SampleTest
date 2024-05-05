//
//  ViewController.swift
//  TestApp
//
//  Created by jay kumar on 05/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView : UICollectionView!
    @IBOutlet weak var activityIndicator : UIActivityIndicatorView!
    var page : Int = 1
    var itemList = [ResponseModelClass]()
    var isPageRefreshing:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        loadDataFromApi(page)
        // Do any additional setup after loading the view.
    }
    //Setup collection view - like collectionView cell regrester, collectionViewLayout etc
    private func setUpCollectionView(){
        collectionView.register(UINib(nibName: "CustomViewCell", bundle: nil), forCellWithReuseIdentifier: "customView")
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            let width = (view.bounds.width - 10)/2
            flowLayout.itemSize = CGSize(width: width, height: width)
        }
        
    }
    //Call service to load the data
    private func loadDataFromApi(_ pageCount : Int){
        URLSession.shared.dataTask(with: NSURL(string: "https://jsonplaceholder.typicode.com/posts?_page=\(pageCount)&_limit=10")! as URL) { [self] data, response, error in
            itemList.append(contentsOf: try! JSONDecoder().decode([ResponseModelClass].self, from: data!))
            DispatchQueue.main.async { [self] in
                collectionView.reloadData()
                isPageRefreshing = false
                activityIndicator.stopAnimating()
            }
        }.resume()
    }
    //Scroll delegate event , get called while scrolling
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(collectionView.contentOffset.y >= (collectionView.contentSize.height - collectionView.bounds.size.height)) {
            if !isPageRefreshing{
                activityIndicator.startAnimating()
                isPageRefreshing = true
                page += 1
                loadDataFromApi(page)
            }
        }
    }
    //Prefrom segue methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if let value = sender as? ResponseModelClass {
             let detailsVC = segue.destination as! DetailsViewController
             detailsVC.selectedData = value
         }
    }
}
//collection View Delegate/dataSource

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource{

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customView", for: indexPath) as! CustomViewCell
        cell.loadValue(itemList[indexPath.row].title!)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailsView", sender: itemList[indexPath.row])
    }
}
    
    
