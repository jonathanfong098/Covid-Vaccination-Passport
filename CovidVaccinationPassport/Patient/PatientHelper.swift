//
//  PatientHelper.swift
//  CovidVaccinationPassport
//
//  Created by Jonathan Fong on 5/6/21.
//

import Foundation

enum patientHelper {
    enum gender: String, CaseIterable, Identifiable {
        case male = "Male"
        case female = "Female"
        
        var id: String { self.rawValue }
    }
    
    enum AmericanState : String, CaseIterable, Identifiable{
        case alabama            = "AL - Alabama"
        case alaska             = "AK - Alaska"
        case arizona            = "AZ - Arizona"
        case arkansas           = "AR - Arkansas"
        case california         = "CA - California"
        case colorado           = "CO - Colorado"
        case connecticut        = "CT - Connecticut "
        case delaware           = "DE - Deleware"
        case washingtonDistrictOfColumbia = "Washington DC - District of Colombia"
        case florida            = "FL - Flordia"
        case georgia            = "GA - Georgia"
        case hawaii             = "HI - Hawaii"
        case idaho              = "ID - Idaho"
        case illinois           = "IL Illinois"
        case indiana            = "IN - Indiana"
        case iowa               = "IA - Iowa"
        case kansas             = "KS - Kansa"
        case kentucky           = "KY - Kentucky"
        case louisiana          = "LA - Lousiana"
        case maine              = "ME - Maine"
        case maryland           = "MD - Maryland"
        case massachusetts      = "MA - Maine"
        case michigan           = "MI - Michigan"
        case minnesota          = "MN - Minnesota"
        case mississippi        = "MS - Mississippi"
        case missouri           = "MO - Missouri"
        case montana            = "MT - Montana"
        case nebraska           = "NE - Nebraska"
        case nevada             = "NV - Nevada"
        case newHampshire       = "NH - New Hampshire"
        case newJersey          = "NJ - New Jersey"
        case newMexico          = "NM - New Mexico"
        case newYork            = "NY - New York"
        case northCarolina      = "NC - North Carolina"
        case northDakota        = "ND - North Dakota"
        case ohio               = "OH - Ohio"
        case oklahoma           = "OK - Oklahoma"
        case oregon             = "OR - Orgeon"
        case pennsylvania       = "PA - Pennssylvania"
        case rhodeIsland        = "RI - Rhode Island"
        case southCarolina      = "SC - South Carolina"
        case southDakota        = "SD - South Dakota"
        case tennessee          = "TN - Tennessee"
        case texas              = "TX - Texxas"
        case utah               = "UT - Utah"
        case vermont            = "VT - Vermont"
        case virginia           = "VA - Virginia"
        case washington         = "WA - Washington"
        case westVirginia       = "WV - West Virginia"
        case wisconsin          = "WI - Wisconsin"
        case wyoming            = "WY - Wyoming"
        
        var id: String { self.rawValue }

        var displayName: String {
            switch self {
            case .alabama: return NSLocalizedString("Alabama", comment: "")
            case .alaska: return NSLocalizedString("Alaska", comment: "")
            case .arizona: return NSLocalizedString("Arizona", comment: "")
            case .arkansas: return NSLocalizedString("Arkansas", comment: "")
            case .california: return NSLocalizedString("California", comment: "")
            case .colorado: return NSLocalizedString("Colorado", comment: "")
            case .connecticut: return NSLocalizedString("Connecticut", comment: "")
            case .delaware: return NSLocalizedString("Delaware", comment: "")
            case .washingtonDistrictOfColumbia: return NSLocalizedString("Washington District of Columbia", comment: "")
            case .florida: return NSLocalizedString("Florida", comment: "")
            case .georgia: return NSLocalizedString("Georgia", comment: "")
            case .hawaii: return NSLocalizedString("Hawaii", comment: "")
            case .idaho: return NSLocalizedString("Idaho", comment: "")
            case .illinois: return NSLocalizedString("Illinois", comment: "")
            case .indiana: return NSLocalizedString("Indiana", comment: "")
            case .iowa: return NSLocalizedString("Iowa", comment: "")
            case .kansas: return NSLocalizedString("Kansas", comment: "")
            case .kentucky: return NSLocalizedString("Kentucky", comment: "")
            case .louisiana: return NSLocalizedString("Louisiana", comment: "")
            case .maine: return NSLocalizedString("Maine", comment: "")
            case .maryland: return NSLocalizedString("Maryland", comment: "")
            case .massachusetts: return NSLocalizedString("Massachusetts", comment: "")
            case .michigan: return NSLocalizedString("Michigan", comment: "")
            case .minnesota: return NSLocalizedString("Minnesota", comment: "")
            case .mississippi: return NSLocalizedString("Mississippi", comment: "")
            case .missouri: return NSLocalizedString("Missouri", comment: "")
            case .montana: return NSLocalizedString("Montana", comment: "")
            case .nebraska: return NSLocalizedString("Nebraska", comment: "")
            case .nevada: return NSLocalizedString("Nevada", comment: "")
            case .newHampshire: return NSLocalizedString("New Hampshire", comment: "")
            case .newJersey: return NSLocalizedString("New Jersey", comment: "")
            case .newMexico: return NSLocalizedString("New Mexico", comment: "")
            case .newYork: return NSLocalizedString("New York", comment: "")
            case .northCarolina: return NSLocalizedString("North Carolina", comment: "")
            case .northDakota: return NSLocalizedString("North Dakota", comment: "")
            case .ohio: return NSLocalizedString("Ohio", comment: "")
            case .oklahoma: return NSLocalizedString("Oklahoma", comment: "")
            case .oregon: return NSLocalizedString("Oregon", comment: "")
            case .pennsylvania: return NSLocalizedString("Pennsylvania", comment: "")
            case .rhodeIsland: return NSLocalizedString("Rhode Island", comment: "")
            case .southCarolina: return NSLocalizedString("South Carolina", comment: "")
            case .southDakota: return NSLocalizedString("South Dakota", comment: "")
            case .tennessee: return NSLocalizedString("Tennessee", comment: "")
            case .texas: return NSLocalizedString("Texas", comment: "")
            case .utah: return NSLocalizedString("Utah", comment: "")
            case .vermont: return NSLocalizedString("Vermont", comment: "")
            case .virginia: return NSLocalizedString("Virginia", comment: "")
            case .washington: return NSLocalizedString("Washington", comment: "")
            case .westVirginia: return NSLocalizedString("West Virginia", comment: "")
            case .wisconsin: return NSLocalizedString("Wisconsin", comment: "")
            case .wyoming: return NSLocalizedString("Wyoming", comment: "")
            }
        }
    }

}

