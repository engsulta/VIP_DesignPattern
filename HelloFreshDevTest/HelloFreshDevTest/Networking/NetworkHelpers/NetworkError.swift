
import Foundation

enum NetworkError: String, Error {
    case missingURL = "missing URL"
    case faildToDecode = "unable to decode the response"
    case noNetwork = "unknown"
}
