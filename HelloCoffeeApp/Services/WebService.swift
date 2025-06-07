import Foundation

class WebService {

    enum NetworkError: Error {
        case badUrl
        case decodingError
        case badRequest
    }

    func getOrders() async throws -> [Order] {
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            throw NetworkError.badUrl
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }

        guard let orders = try? JSONDecoder().decode([Order].self, from: data) else {
            throw NetworkError.decodingError
        }

        return orders
    }
}
