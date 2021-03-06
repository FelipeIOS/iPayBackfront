import Foundation

// MARK: - ProductList
class ProductList: Codable {
    let productID, productType, date, name: String
    let price: Double
    let quantity: Int

    init(productID: String, productType: String, date: String, name: String, price: Double, quantity: Int) {
        self.productID = productID
        self.productType = productType
        self.date = date
        self.name = name
        self.price = price
        self.quantity = quantity
    }
}

// MARK: ProductList convenience initializers and mutators

extension ProductList {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(ProductList.self, from: data)
        self.init(productID: me.productID, productType: me.productType, date: me.date, name: me.name, price: me.price, quantity: me.quantity)
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
        productID: String? = nil,
        productType: String? = nil,
        date: String? = nil,
        name: String? = nil,
        price: Double? = nil,
        quantity: Int? = nil
    ) -> ProductList {
        return ProductList(
            productID: productID ?? self.productID,
            productType: productType ?? self.productType,
            date: date ?? self.date,
            name: name ?? self.name,
            price: price ?? self.price,
            quantity: quantity ?? self.quantity
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

