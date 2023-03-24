//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Yasin Çevik on 25.03.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var cityName = [String]()
    var landmarkImage = [UIImage]()
    var landmarkName = [String]()
    
    var choosenLandmarkName = ""
    var choosenLandmarkImage = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        landmarkName.append("Galata Kulesi")
        landmarkName.append("Anıtkabir")
        landmarkName.append("Onur Anıtı")
        landmarkName.append("Saat Kulesi")
        landmarkName.append("Sehitlik")
        
        cityName.append("Istanbul")
        cityName.append("Ankara")
        cityName.append("Samsun")
        cityName.append("Izmir")
        cityName.append("Canakkale")

        landmarkImage.append(UIImage(named: "istanbul.jpg")!)
        landmarkImage.append(UIImage(named: "ankara.jpg")!)
        landmarkImage.append(UIImage(named: "samsun.jpg")!)
        landmarkImage.append(UIImage(named: "izmir.jpg")!)
        landmarkImage.append(UIImage(named: "canakkale.jpg")!)

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
//        cell.textLabel?.text = "test"
        var content = cell.defaultContentConfiguration()
        content.text = cityName[indexPath.row]
        content.secondaryText = landmarkName[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        choosenLandmarkName = landmarkName[indexPath.row]
        choosenLandmarkImage = landmarkImage[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.selectedLandmarkName = choosenLandmarkName
            destinationVC.selectedLandmarkImage = choosenLandmarkImage
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.landmarkName.remove(at: indexPath.row)
            self.landmarkImage.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

