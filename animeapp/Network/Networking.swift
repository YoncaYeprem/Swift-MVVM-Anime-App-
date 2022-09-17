//
//  Networking.swift
//  animeapp
//
//  Created by YONCA YEPREM on 16.09.2022.
//

import Foundation
import UIKit

//Status for request
enum Result<Value: Decodable>{
    case success(Value)
    case failure(Bool)
}

//Type of request
public enum Method{
    case get
    case post
    case other(method: String)
}

typealias Handler = (Result<Data>) -> Void

//Convert Method enums to values
extension Method{
    public init(_ rawValue:String){
        let method = rawValue.uppercased()
        switch method {
        case "GET":
            self = .get
        case "POST":
            self = .post
        default:
            self = .other(method: method)
        }
    }
}

extension Method: CustomStringConvertible {
    public var description: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .other(let method):
            return method.uppercased()
        }
    }
}
