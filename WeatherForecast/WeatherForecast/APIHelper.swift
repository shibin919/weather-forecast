//
//  APIHelper.swift
//  WeatherForecast
//
//  Created by Shibin on 18/03/2023.
//

import UIKit
import Alamofire

class APIHelper{
    static var sharedInstance = APIHelper()
    
    //        if !AVReachability.isConnectedToNetwork(){
    //            onCompletion(createNSError("No internet"), nil)
    //            return
    //        }
    
    func fetchWeatherData(_ requestURL:String, onCompletion: @escaping (NSError?, CountryGeocodeModel?) -> Void) -> Void {
        if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: URL(string: requestURL)!)) {
            do {
                let decoder = JSONDecoder()
                let userData = try decoder.decode([CountryGeocodeModel].self, from: cachedResponse.data)
                onCompletion(nil, userData.first)
                return
            } catch let error as NSError {
                onCompletion(error,nil)
                return
            }
        }
        
        AF.request(requestURL,method: .get, encoding: JSONEncoding.default,headers: nil)
            .validate()
            .response { (response) in
                let error = response.error
                if error == nil {
                    if let data = response.data {
                        do {
                            let decoder = JSONDecoder()
                            let userData = try decoder.decode([CountryGeocodeModel].self, from: data)
                            onCompletion(nil, userData.first)
                            
                            // Cache the response
                            if let response = response.response {
                                let cachedResponse = CachedURLResponse(response: response, data: data)
                                URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: response.url!))
                            }
                        } catch let error as NSError {
                            onCompletion(error,nil)
                        }
                    }
                } else {
                    onCompletion(error as NSError?,nil)
                }
            }
    }



    
    
    func fetchWeatherDataForCurrentLocation(_ requestURL:String, onCompletion: @escaping (NSError?, baseLocModel?) -> Void) -> Void {
        
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        let session = URLSession(configuration: configuration)
        
        guard let url = URL(string: requestURL) else { return }
        let request = URLRequest(url: url)
        
        if let cachedResponse = URLCache.shared.cachedResponse(for: request) {
            do {
                let decoder = JSONDecoder()
                let userData = try decoder.decode(baseLocModel.self, from: cachedResponse.data)
                onCompletion(nil, userData)
                return
            } catch let error as NSError {
                onCompletion(error, nil)
                return
            }
        }
        
        AF.request(requestURL, method: .get, encoding: JSONEncoding.default, headers: nil)
            .validate()
            .response { (response) in
                let error = response.error
                if error == nil {
                    if let data = response.data {
                        do {
                            let decoder = JSONDecoder()
                            let userData = try decoder.decode(baseLocModel.self, from: data)
                            let cachedResponse = CachedURLResponse(response: response.response!, data: data)
                            URLCache.shared.storeCachedResponse(cachedResponse, for: request)
                            onCompletion(nil, userData)
                        } catch let error as NSError {
                            onCompletion(error, nil)
                        }
                    }
                } else {
                    onCompletion(error as NSError?, nil)
                }
            }
    }

    func fetchWeatherDataForLocation(_ requestURL:String, onCompletion: @escaping (NSError?, weatherModel?) -> Void) -> Void {

        // Create a URL request with the provided URL
        guard let url = URL(string: requestURL) else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            onCompletion(error, nil)
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"

        // Check if the response is cached
        if let cachedResponse = URLCache.shared.cachedResponse(for: urlRequest) {
            do {
                let decoder = JSONDecoder()
                let userData = try decoder.decode(weatherModel.self, from: cachedResponse.data)
                onCompletion(nil, userData)
            } catch let error as NSError {
                onCompletion(error, nil)
            }
            return
        }

        // If the response is not cached, make the network request and cache the response
        AF.request(urlRequest)
            .validate()
            .response { (response) in
                let error = response.error
                if error == nil {
                    if let data = response.data {
                        do {
                            let decoder = JSONDecoder()
                            let userData = try decoder.decode(weatherModel.self, from: data)
                            onCompletion(nil, userData)

                            // Cache the response
                            let cachedResponse = CachedURLResponse(response: response.response!, data: data)
                            URLCache.shared.storeCachedResponse(cachedResponse, for: urlRequest)
                        } catch let error as NSError {
                            onCompletion(error, nil)
                        }
                    }
                } else {
                    onCompletion(error as NSError?, nil)
                }
            }
    }
    
    
    func createNSError(_ message:String)-> NSError{
        let error =    NSError(domain: "Alert", code: 2, userInfo: ["Message" : message,NSLocalizedDescriptionKey:message])
        return error
    }
}


import SystemConfiguration
public class AVReachability {
    
    class func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags : SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return (isReachable && !needsConnection)
    }
    
}


