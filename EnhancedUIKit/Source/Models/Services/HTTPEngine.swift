//
//  HTTPEngine.swift
//  EnhancedUIKit
//
//  Created by Burak Uzunboy on 16.06.2018.
//  Copyright © 2018 EUIKit. All rights reserved.
//

import UIKit

extension EUIKit {
    
    /**
     * Executes HTTP Requests.
     * - since: 1.0.0
     */
    public class HTTPEngine {
        
        private init() {
            
        }
        
        /**
         * Executes **POST** request.
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL String for request
         * - parameter body: Body of the request as a dictionary
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter result: Returns response of the request, otherwise nil.
         */
        public class func post(_ withURL: String, body: [String:Any]?, headers: [String:String]?, completion: @escaping (_ error: Error?, _ result: Any?)->()) {
            let urlConverter = self.controlURLString(withURL)
            if let error = urlConverter.1 {
                completion(error, nil)
            } else {
                self.post(urlConverter.0!, body: body, headers: headers, completion: completion)
            }
        }
        
        /**
         * Executes **POST** request.
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL for request
         * - parameter body: Body of the request as a dictionary
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter result: Returns response of the request, otherwise nil.
         */
        public class func post(_ withURL: URL, body: [String:Any]?, headers: [String:String]?, completion: @escaping (_ error: Error?, _ result: Any?)->()) {
            self.executeRequest(withURL, type: .post, body: body, headers: headers, completion: completion)
        }
        
        /**
         * Executes **GET** request.
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL String for request
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter result: Returns response of the request, otherwise nil.
         */
        public class func get(_ withURL: String, headers: [String:String]?, completion: @escaping (_ error: Error?, _ result: Any?)->()) {
            let urlConverter = self.controlURLString(withURL)
            if let error = urlConverter.1 {
                completion(error, nil)
            } else {
                self.get(urlConverter.0!, headers: headers, completion: completion)
            }
        }
        
        /**
         * Executes **GET** request.
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL for request
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter result: Returns response of the request, otherwise nil.
         */
        public class func get(_ withURL: URL, headers: [String:String]?, completion: @escaping (_ error: Error?, _ result: Any?)->()) {
            self.executeRequest(withURL, type: .get, body: nil, headers: headers, completion: completion)
        }
        
        /**
         * Executes **PUT** request.
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL String for request
         * - parameter body: Body of the request as a dictionary
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter result: Returns response of the request, otherwise nil.
         */
        public class func put(_ withURL: String, body: [String:Any]?, headers: [String:String]?, completion: @escaping (_ error: Error?, _ result: Any?)->()) {
            let urlConverter = self.controlURLString(withURL)
            if let error = urlConverter.1 {
                completion(error, nil)
            } else {
                self.put(urlConverter.0!, body: body, headers: headers, completion: completion)
            }
        }
        
        /**
         * Executes **PUT** request.
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL for request
         * - parameter body: Body of the request as a dictionary
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter result: Returns response of the request, otherwise nil.
         */
        public class func put(_ withURL: URL, body: [String:Any]?, headers: [String:String]?, completion: @escaping (_ error: Error?, _ result: Any?)->()) {
            self.executeRequest(withURL, type: .put, body: body, headers: headers, completion: completion)
        }
        
        /**
         * Executes **PATCH** request.
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL String for request
         * - parameter body: Body of the request as a dictionary
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter result: Returns response of the request, otherwise nil.
         */
        public class func patch(_ withURL: String, body: [String:Any]?, headers: [String:String]?, completion: @escaping (_ error: Error?, _ result: Any?)->()) {
            let urlConverter = self.controlURLString(withURL)
            if let error = urlConverter.1 {
                completion(error, nil)
            } else {
                self.patch(urlConverter.0!, body: body, headers: headers, completion: completion)
            }
        }
        
        /**
         * Executes **PATCH** request.
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL for request
         * - parameter body: Body of the request as a dictionary
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter result: Returns response of the request, otherwise nil.
         */
        public class func patch(_ withURL: URL, body: [String:Any]?, headers: [String:String]?, completion: @escaping (_ error: Error?, _ result: Any?)->()) {
            self.executeRequest(withURL, type: .patch, body: body, headers: headers, completion: completion)
        }
        
        /**
         * Executes **DELETE** request.
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL String for request
         * - parameter body: Body of the request as a dictionary
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter result: Returns response of the request, otherwise nil.
         */
        public class func delete(_ withURL: String, body: [String:Any]?, headers: [String:String]?, completion: @escaping (_ error: Error?, _ result: Any?)->()) {
            let urlConverter = self.controlURLString(withURL)
            if let error = urlConverter.1 {
                completion(error, nil)
            } else {
                self.delete(urlConverter.0!, body: body, headers: headers, completion: completion)
            }
        }
        
        /**
         * Executes **DELETE** request.
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL for request
         * - parameter body: Body of the request as a dictionary
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter result: Returns response of the request, otherwise nil.
         */
        public class func delete(_ withURL: URL, body: [String:Any]?, headers: [String:String]?, completion: @escaping (_ error: Error?, _ result: Any?)->()) {
            self.executeRequest(withURL, type: .delete, body: body, headers: headers, completion: completion)
        }
        
        private class func executeRequest(_ withURL: URL, type: requestHTTPType, body: [String:Any]?, headers: [String:String]?, completion: @escaping (_ error: Error?, _ result: Any?)->()) {
            
            var request = URLRequest(url: withURL)
            request.httpMethod = type.rawValue
            request.allHTTPHeaderFields = headers
            if let body = body {
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                do {
                    request.httpBody = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
                } catch {
                    let err = NSError(domain: extendedErrorDomains.EUIKitDomain.rawValue, code: extendedErrorCodes.jsonError.rawValue, description: "Couldn't prepare http body - Error: \(error.localizedDescription) - Body: \(body)")
                    completion(err, nil)
                }
            }
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    let nsErr = error as NSError
                    let err = NSError(domain: nsErr.domain, code: nsErr.code, description: "Error occured during task - Error: \(error.localizedDescription)")
                    completion(err, nil)
                    return
                }
                if let response = response {
                    let httpResp = response as! HTTPURLResponse
                    
                    if httpResp.statusCode < 300 && httpResp.statusCode >= 200 {
                        if data != nil {
                            guard let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions(rawValue: 0)),
                                let jsonDictionary = json as? [String: AnyObject] else {
                                    let err = NSError(domain: extendedErrorDomains.EUIKitDomain.rawValue, code: extendedErrorCodes.jsonError.rawValue, description: "Couldn't prepare json from response")
                                    completion(err, nil)
                                    return
                            }
                            completion(nil, jsonDictionary)
                        } else {
                            let err = NSError(domain: extendedErrorDomains.EUIKitDomain.rawValue, code: extendedErrorCodes.taskError.rawValue, description: "No data found in the response with response code: \(httpResp.statusCode)")
                            completion(err, nil)
                        }
                    } else {
                        let err = NSError(domain: extendedErrorDomains.EUIKitDomain.rawValue, code: httpResp.statusCode, description: HTTPURLResponse.localizedString(forStatusCode: httpResp.statusCode))
                        completion(err, nil)
                    }
                } else {
                    let err = NSError(domain: extendedErrorDomains.EUIKitDomain.rawValue, code: extendedErrorCodes.taskError.rawValue, description: "No response is received")
                    completion(err, nil)
                }
                
                
            }
            task.resume()
        }
        
        private class func controlURLString(_ string: String) -> (URL?,NSError?) {
            if let url = URL(string: string) {
                return (url, nil)
            } else {
                let err = NSError(domain: extendedErrorDomains.EUIKitDomain.rawValue, code: extendedErrorCodes.urlConvertionError.rawValue, description: "Couldn't prepare url with the given string - String: \(string)")
                return (nil, err)
            }
        }
        
    }
}

