

import Foundation

// MARK: - Account
class Account: Codable {
    let totalValue: Int
    let productList: [ProductList]

    init(totalValue: Int, productList: [ProductList]) {
        self.totalValue = totalValue
        self.productList = productList
    }
}

// MARK: Account convenience initializers and mutators

extension Account {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Account.self, from: data)
        self.init(totalValue: me.totalValue, productList: me.productList)
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
        totalValue: Int? = nil,
        productList: [ProductList]? = nil
    ) -> Account {
        return Account(
            totalValue: totalValue ?? self.totalValue,
            productList: productList ?? self.productList
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}


