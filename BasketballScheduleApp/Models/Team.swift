//
//  Team.swift
//  BasketballScheduleApp
//
//  Created by Ranjit on 21/12/24.
//

import Foundation

// MARK: - Teams
struct Teams: Codable {
    let data: TeamData?
}

// MARK: - TeamData
struct TeamData: Codable {
    let teams: [Team]?
}

// MARK: - Team
struct Team: Codable {
    let uid: String?
    let year: Int?
    let leagueID, seasonID, istGroup, tid: String?
    let tn, ta, tc, di: String?
    let co: Co?
    let sta: String?
    let logo: String?
    let color: String?
    let customFields: JSONNull?
    let templateFields: EventTemplate?

    enum CodingKeys: String, CodingKey {
        case uid, year
        case leagueID = "league_id"
        case seasonID = "season_id"
        case istGroup = "ist_group"
        case tid, tn, ta, tc, di, co, sta, logo, color
        case customFields = "custom_fields"
        case templateFields = "template_fields"
    }
}

enum Co: String, Codable {
    case east = "East"
    case west = "West"
}

// MARK: - EventTemplate
struct EventTemplate: Codable {
    let version: Int?
    let locale: Locale?
    let acl: ACL?
    let createdAt: String?
    let createdBy: CreatedBy?
    let dfeClassUid, leagueID: String?
    let logo: String?
    let seasonID, ta: String?
    let tags: [JSONAny]?
    let tc, tid, title, tn: String?
    let updatedAt: String?
    let updatedBy: UpdatedBy?
    let year: Int?
    let publishDetails: PublishDetails?

    enum CodingKeys: String, CodingKey {
        case version = "_version"
        case locale
        case acl = "ACL"
        case createdAt = "created_at"
        case createdBy = "created_by"
        case dfeClassUid = "dfe_class_uid"
        case leagueID = "league_id"
        case logo
        case seasonID = "season_id"
        case ta, tags, tc, tid, title, tn
        case updatedAt = "updated_at"
        case updatedBy = "updated_by"
        case year
        case publishDetails = "publish_details"
    }
}

// MARK: - ACL
struct ACL: Codable {
}

enum CreatedBy: String, Codable {
    case bltd2C33A5D025E0530 = "bltd2c33a5d025e0530"
}

enum Locale: String, Codable {
    case enUs = "en-us"
}

// MARK: - PublishDetails
struct PublishDetails: Codable {
    let environment: Environment?
    let locale: Locale?
    let time: String?
    let user: UpdatedBy?
}

enum Environment: String, Codable {
    case bltbccb042732E19B69 = "bltbccb042732e19b69"
}

enum UpdatedBy: String, Codable {
    case blt3B0E6Dba12024A93 = "blt3b0e6dba12024a93"
}

