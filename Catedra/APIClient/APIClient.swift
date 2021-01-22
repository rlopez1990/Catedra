//
//  APIClient.swift
//  Catedra
//
//  Created by Raul Lopez Martinez on 18/01/21.
//  Copyright © 2021 Raul Lopez Martinez. All rights reserved.
//

import Foundation

enum SectionPath: String {
    case democracyReports = "informesdemocracia"
    case humaRightsReports = "informesderechoshumanos"
    case forum = "forocatedramadero"
    case volunteers = "voluntarios"
    case podcast = "podcast"
    case contact = "contacto"
}

final class APIClient {
    private static let baseURL = "https://www.catedramadero.com"
    
    static func url(for path: SectionPath? = nil) -> URL? {
        var completeURL = APIClient.baseURL
        if let pathValue = path?.rawValue {
            completeURL = completeURL + "/" + pathValue
        }
        return URL(string: completeURL)
    }
}
