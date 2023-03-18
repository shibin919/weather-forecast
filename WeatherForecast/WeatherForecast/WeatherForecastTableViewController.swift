//
//  WeatherForecastTableViewController.swift
//  WeatherForecast
//
//  Created by Shibin on 18/03/2023.
//

import UIKit
import Alamofire
import CoreLocation

class WeatherForecastTableViewController: UITableViewController {
    
    var cityNameList: [String] = []
    var weatherDataList: [weatherModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        fetchGeocodeData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if !AVReachability.isConnectedToNetwork(){
            showOfflineAlert()
        }
    }
    
    func showOfflineAlert() {
        let alertController = UIAlertController(title: "No Internet Connection", message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func fetchGeocodeData() {
        cityNameList.forEach { cityName in
            let requestURL = geoCodeUrl.replacingOccurrences(of: "{cityName}", with: "\(cityName)")
            APIHelper.sharedInstance.fetchWeatherData(requestURL) { [self] error, weatherData in
                if error == nil {
                    if let weatherData = weatherData {
                      print(weatherData)
                        fetchWeatherData(location: CLLocation(latitude: weatherData.lat ?? 0, longitude: weatherData.lon ?? 0))
                    }
                } else {
                    debugPrint(error?.description ?? "SOMETHING WENT WRONG")
                }
            }
        }
    }
    
    func fetchWeatherData(location: CLLocation) {
            let requestURL = "http://api.openweathermap.org/data/2.5/weather?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&appid=fb4c0a36a6a74b02e7cf0490c1d8df77"
            APIHelper.sharedInstance.fetchWeatherDataForLocation(requestURL) { [self] error, weatherData in
                if error == nil {
                    if let weatherData = weatherData {
                        weatherDataList.append(weatherData)
                        tableView.reloadData()
                    }
                } else {
                    debugPrint(error?.description ?? "SOMETHING WENT WRONG")
                }
            }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weatherDataList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherForecastTableViewCell", for: indexPath) as! WeatherForecastTableViewCell
        cell.loadCellData(data: weatherDataList[indexPath.row])
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
