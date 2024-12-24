//
//  Schedule.swift
//  BasketballScheduleApp
//
//  Created by Ranjit on 21/12/24.
//

import Foundation

// MARK: - Schedule
struct Schedule: Codable {
    let data: ScheduleData?
}

// MARK: - ScheduleData
struct ScheduleData: Codable {
    let schedules: [ScheduleElement]?
}

// MARK: - ScheduleElement
struct ScheduleElement: Codable, Equatable, Identifiable {
    var id : String { uid }
    
    static func == (lhs: ScheduleElement, rhs: ScheduleElement) -> Bool {
        return lhs.uid == rhs.uid
    }

    let uid: String
    let year: Int?
    let leagueID, seasonID: String?
    let h, v: H?
    let gid, gcode: String?
    let buyTicket: String?
    let bd: Bd?
    let seri, isGameNecessary, gametime: String?
    let cl: Cl?
    let arenaName, arenaCity, arenaState: String?
    let st: Int?
    let stt: String?
    let ppdst: Ppdst?
    let buyTicketURL: String?
    let logoURL: JSONNull?
    let hide: Bool?
    let gameState: GameState?
    let gameSubtype: String?
    let customFields: JSONNull?
    let templateFields: TemplateFields?
    let csCustomFields: CSCustomFields?

    enum CodingKeys: String, CodingKey {
        case uid, year
        case leagueID = "league_id"
        case seasonID = "season_id"
        case h, v, gid, gcode
        case buyTicket = "buy_ticket"
        case bd, seri
        case isGameNecessary = "is_game_necessary"
        case gametime, cl
        case arenaName = "arena_name"
        case arenaCity = "arena_city"
        case arenaState = "arena_state"
        case st, stt, ppdst
        case buyTicketURL = "buy_ticket_url"
        case logoURL = "logo_url"
        case hide
        case gameState = "game_state"
        case gameSubtype = "game_subtype"
        case customFields = "custom_fields"
        case templateFields = "template_fields"
        case csCustomFields = "cs_custom_fields"
    }
}


// MARK: - Bd
struct Bd: Codable {
    let b: [B]?
}

// MARK: - B
struct B: Codable {
    let seq: Int?
    let broadcasterID: Int?
    let disp: String?
    let scope: Scope?
    let type: TypeEnum?
    let lan: LAN?
    let url: String?
    let dfeDisplayText, dfeBroadcasterLogo, dfeClickThroughURL, customField1: JSONNull?
    let customField2: JSONNull?

    enum CodingKeys: String, CodingKey {
        case seq
        case broadcasterID = "broadcasterId"
        case disp, scope, type, lan, url
        case dfeDisplayText = "dfe_display_text"
        case dfeBroadcasterLogo = "dfe_broadcaster_logo"
        case dfeClickThroughURL = "dfe_click_through_url"
        case customField1 = "custom_field_1"
        case customField2 = "custom_field_2"
    }
}

enum LAN: String, Codable {
    case empty = ""
    case english = "English"
}

enum Scope: String, Codable {
    case away = "away"
    case can = "can"
    case home = "home"
    case natl = "natl"
}

enum TypeEnum: String, Codable {
    case nss = "nss"
    case ott = "ott"
    case radio = "radio"
    case tv = "tv"
}

enum Cl: String, Codable {
    case empty = ""
    case the00000 = "00:00.0"
}

// MARK: - CSCustomFields
struct CSCustomFields: Codable {
    let familyNight: String?
    let sponsor: Sponsor?
    let hideTuneIn: Bool?
    let tuneIn, utilityMenu: [JSONAny]?

    enum CodingKeys: String, CodingKey {
        case familyNight = "family_night"
        case sponsor
        case hideTuneIn = "hide_tune_in"
        case tuneIn = "tune_in"
        case utilityMenu = "utility_menu"
    }
}

// MARK: - Sponsor
struct Sponsor: Codable {
    let image: JSONNull?
    let clickthroughLink: String?

    enum CodingKeys: String, CodingKey {
        case image
        case clickthroughLink = "clickthrough_link"
    }
}

enum GameState: String, Codable {
    case active = "active"
}

// MARK: - H
struct H: Codable {
    let tid, re, ta, tn: String?
    let tc, s: String?
    let istGroup: IstGroup?

    enum CodingKeys: String, CodingKey {
        case tid, re, ta, tn, tc, s
        case istGroup = "ist_group"
    }
}

enum IstGroup: String, Codable {
    case eastGroupB = "East Group B"
    case eastGroupC = "East Group C"
}

enum Ppdst: String, Codable {
    case i = "I"
}

// MARK: - TemplateFields
struct TemplateFields: Codable {
    let accessPassSetup: AccessPassSetup?
    let heatJerseyLink: String?

    enum CodingKeys: String, CodingKey {
        case accessPassSetup = "access_pass_setup"
        case heatJerseyLink = "heat_jersey_link"
    }
}

// MARK: - AccessPassSetup
struct AccessPassSetup: Codable {
    let stmCost, nonStmCost, totalPassesAllowed, availablePasses: Int?
    let noThreshold: Bool?
    let fortressPassesSold: JSONNull?

    enum CodingKeys: String, CodingKey {
        case stmCost = "stm_cost"
        case nonStmCost = "non_stm_cost"
        case totalPassesAllowed = "total_passes_allowed"
        case availablePasses = "available_passes"
        case noThreshold = "no_threshold"
        case fortressPassesSold = "fortress_passes_sold"
    }
}
