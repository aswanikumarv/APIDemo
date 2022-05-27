//
//  CustomError.swift
//  TableWithJson
//
//  Created by Ashwin  on 23/02/22.
//

import Foundation

enum CustomError: Error {
    
    case urlNotFound
    case sessionError
    case dataParsingError
    // Throw in all other cases
    case unexpected(code: Int)
}

extension CustomError {
    var isFatal: Bool {
        if case CustomError.unexpected = self { return true }
        else { return false }
    }
}

extension CustomError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .urlNotFound:
            return "URL is not valid."
        case .sessionError:
            return "Session Error."
        case .dataParsingError:
            return "Data parsing Error."
        case .unexpected(_):
            return "An unexpected error occurred."

        }
    }
}

// For each error type return the appropriate localized description
extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .urlNotFound:
            return NSLocalizedString(
                "The provided password is not valid.",
                comment: "Invalid Password"
            )
        case .sessionError:
            return NSLocalizedString(
                "The specified item could not be found.",
                comment: "Resource Not Found"
            )
        case .dataParsingError:
            return NSLocalizedString(
                "The specified item could not be found.",
                comment: "Resource Not Found"
            )
        case .unexpected(_):
            return NSLocalizedString(
                "An unexpected error occurred.",
                comment: "Unexpected Error"
            )
        }
    }
}


