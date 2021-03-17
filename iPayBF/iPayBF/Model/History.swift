//
//  History.swift
//  iPayBF
//
//  Created by Wagner Ongaro Junior on 15/03/21.
//

import Foundation

// MARK: - History
class History: Codable {
    let totalValue: Double
    let historyAccountList: [HistoryAccountList]

    init(totalValue: Double, historyAccountList: [HistoryAccountList]) {
        self.totalValue = totalValue
        self.historyAccountList = historyAccountList
    }
}

// MARK: - History convenience initializers and mutators

extension History {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(History.self, from: data)
        self.init(totalValue: me.totalValue, historyAccountList: me.historyAccountList)
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
        totalValue: Double? = nil,
        historyAccountList: [HistoryAccountList]? = nil
    ) -> History {
        return History(
            totalValue: totalValue ?? self.totalValue,
            historyAccountList: historyAccountList ?? self.historyAccountList
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
