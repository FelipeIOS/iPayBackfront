//
//  HistoryAccountList.swift
//  iPayBF
//
//  Created by Wagner Ongaro Junior on 15/03/21.
//

import Foundation

// MARK: - HistoryAccountList
class HistoryAccountList: Codable {
    let historyID, date, name: String
    let price: Double
    let iconImage: String

    init(historyID: String, date: String, name: String, price: Double, iconImage: String) {
        self.historyID = historyID
        self.date = date
        self.name = name
        self.price = price
        self.iconImage = iconImage
    }
}

// MARK: HistoryAccountList convenience initializers and mutators

extension HistoryAccountList {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(HistoryAccountList.self, from: data)
        self.init(historyID: me.historyID, date: me.date, name: me.name, price: me.price, iconImage: me.iconImage)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        historyID: String? = nil,
        date: String? = nil,
        name: String? = nil,
        price: Double? = nil,
        iconImage: String? = nil
    ) -> HistoryAccountList {
        return HistoryAccountList(
            historyID: historyID ?? self.historyID,
            date: date ?? self.date,
            name: name ?? self.name,
            price: price ?? self.price,
            iconImage: iconImage ?? self.iconImage
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
