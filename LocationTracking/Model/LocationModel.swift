//
//  LocationModel.swift
//  LocationTracking
//
//  Created by Atul Upadhyay on 21/04/23.
//

import Foundation

struct Response: Codable {
    let response: [String: Location]
}

struct Location: Codable {
    let statusCode: String
    let statusMessage: String
    let codeLoc: String

    enum CodingKeys: String, CodingKey {
        case statusCode
        case statusMessage
        case codeLoc 
    }
}
