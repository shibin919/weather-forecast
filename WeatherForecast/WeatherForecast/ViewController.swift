//
//  ViewController.swift
//  WeatherForecast
//
//  Created by Shibin on 18/03/2023.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!
    var currentLocation: CLLocation?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        currentLocation = locations.first
        locationManager.stopUpdatingLocation()
    }

    @IBAction func fromCityNamesBtnAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Enter city names", message: "-", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "City names"
            textField.text = "cochin"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            if let cityNames = alert.textFields?.first?.text {
                let cityNameList = cityNames.components(separatedBy: ",")
//                if cityNameList.count > 2 && cityNameList.count < 8 {
                    guard let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WeatherForecastTableViewController") as? WeatherForecastTableViewController else {
                        return
                    }
                    nextVC.cityNameList = cityNameList
                    self.navigationController?.pushViewController(nextVC, animated: true)
//                } else {
//                    print("minimum 3 cities and max 7 cities")
//                }
            }
        }))
        present(alert, animated: true)
    }
    
    @IBAction func fromCurrentLocBtnAction(_ sender: UIButton) {
        if let currentLocation = currentLocation {
            guard let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CurrentLocationWeatherTableViewController") as? CurrentLocationWeatherTableViewController else {
                return
            }
            nextVC.currentLocation = currentLocation
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}

