//
//  ViewController.swift
//  MobileAppPromo
//
//  Created by Evita Sihombing on 27/03/24.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var promos = [Promo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ListPromoTableViewCell", bundle: nil), forCellReuseIdentifier: "listCell")
        fetchPromos()
       
    }
    
    private func fetchPromos() {
            PromoService.shared.fetchPromos { [weak self] result in
                switch result {
                case .success(let promos):
                    self?.promos = promos
                    self?.tableView.reloadData()
                case .failure(let error):
                    print("Error fetching promos: \(error)")
                }
            }
        }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return promos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListPromoTableViewCell
        let promo = promos[indexPath.row]
        cell.configure(with: promo)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPromo = promos[indexPath.row].detailURL
        let link = selectedPromo
        
        let detailViewController = DetailPromoViewController()
        detailViewController.articleLink = link
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

