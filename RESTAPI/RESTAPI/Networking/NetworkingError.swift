//
//  NetworkingError.swift
//  RESTAPI
//
//  Created by Nivedha Rajendran on 09.10.24.
//


import Foundation

enum NetworkingError: Error {
    case unableToParseData(DecodingError?)
    case unableToCreateURL
    case urlSessionError(URLError?)
    case httpFailureResponseCode(statusCode: Int)
    case noDataRecieved
    case unknownError
    
    var localizedDescription: String {
            // user feedback
            switch self {
            case .unableToCreateURL, .unableToParseData, .unknownError:
                return "Sorry, something went wrong."
            case .httpFailureResponseCode(_):
                return "Sorry, the connection to our server failed."
            case .urlSessionError(let error):
                return error?.localizedDescription ?? "Something went wrong."
            case .noDataRecieved:
                return "No Data Found"
            }
        }
}
