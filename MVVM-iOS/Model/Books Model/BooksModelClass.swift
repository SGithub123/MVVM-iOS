//
//  ModelClass.swift
//  MVVM-iOS
//
//  Created by Sanket Bhamare on 07/10/21.
//

import Foundation

struct BooksModelClass : Codable {
    
    let count: Int?
    let next: String?
    let previous: JSONNull?
    let results: [BooksResult]?
}

// MARK: - Result
struct BooksResult: Codable {
    let id: Int?
    let authors: [Author]?
    let bookshelves: [String]?
    let downloadCount: Int?
    let formats: Formats?
    let languages: [String]?
    let mediaType: MediaType?
    let subjects: [String]?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case id, authors, bookshelves
        case downloadCount = "download_count"
        case formats, languages
        case mediaType = "media_type"
        case subjects, title
    }
}

// MARK: - Author
struct Author: Codable {
    let birthYear, deathYear: Int?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case birthYear = "birth_year"
        case deathYear = "death_year"
        case name
    }
}

// MARK: - Formats
struct Formats: Codable {
    let applicationXMobipocketEbook: String?
    let applicationPDF: String?
    let textPlainCharsetUsASCII, textPlainCharsetUTF8: String?
    let applicationRDFXML: String?
    let applicationZip: String?
    let applicationEpubZip: String?
    let textHTMLCharsetUTF8: String?
    let textPlainCharsetISO88591: String?
    let imageJPEG: String?
    let textPlain: String?
    let textHTMLCharsetUsASCII: String?
    let textHTML: String?
    let textRtf: String?
    let textHTMLCharsetISO88591: String?
    let applicationPrsTex: String?

    enum CodingKeys: String, CodingKey {
        case applicationXMobipocketEbook = "application/x-mobipocket-ebook"
        case applicationPDF = "application/pdf"
        case textPlainCharsetUsASCII = "text/plain; charset=us-ascii"
        case textPlainCharsetUTF8 = "text/plain; charset=utf-8"
        case applicationRDFXML = "application/rdf+xml"
        case applicationZip = "application/zip"
        case applicationEpubZip = "application/epub+zip"
        case textHTMLCharsetUTF8 = "text/html; charset=utf-8"
        case textPlainCharsetISO88591 = "text/plain; charset=iso-8859-1"
        case imageJPEG = "image/jpeg"
        case textPlain = "text/plain"
        case textHTMLCharsetUsASCII = "text/html; charset=us-ascii"
        case textHTML = "text/html"
        case textRtf = "text/rtf"
        case textHTMLCharsetISO88591 = "text/html; charset=iso-8859-1"
        case applicationPrsTex = "application/prs.tex"
    }
}

enum Language: String, Codable {
    case en = "en"
    case es = "es"
}

enum MediaType: String, Codable {
    case text = "Text"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
