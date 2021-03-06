// Generated by Create API
// https://github.com/kean/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    public static var token: Token {
        Token(path: "/token")
    }

    public struct Token {
        /// Path: `/token`
        public let path: String

        public func post(grantType: GrantType, redirectURL: URL? = nil, _ body: PostRequest) -> Request<GoTrueHTTP.Session> {
            .post(path, query: makePostQuery(grantType, redirectURL), body: body)
        }

        private func makePostQuery(_ grantType: GrantType, _ redirectURL: URL?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(grantType, forKey: "grant_type")
            encoder.encode(redirectURL, forKey: "redirect_url")
            return encoder.items
        }

        public enum GrantType: String, Codable, CaseIterable {
            case password
            case refreshToken = "refresh_token"
            case idToken = "id_token"
        }

        public enum PostRequest: Encodable {
            case userCredentials(GoTrueHTTP.UserCredentials)
            case openIDConnectCredentials(GoTrueHTTP.OpenIDConnectCredentials)

            public func encode(to encoder: Encoder) throws {
                var container = encoder.singleValueContainer()
                switch self {
                case .userCredentials(let value): try container.encode(value)
                case .openIDConnectCredentials(let value): try container.encode(value)
                }
            }
        }
    }
}

extension Paths {
    public static var signup: Signup {
        Signup(path: "/signup")
    }

    public struct Signup {
        /// Path: `/signup`
        public let path: String

        public func post(redirectURL: URL? = nil, _ body: GoTrueHTTP.SignUpRequest? = nil) -> Request<PostResponse> {
            .post(path, query: makePostQuery(redirectURL), body: body)
        }

        public enum PostResponse: Decodable {
            case session(GoTrueHTTP.Session)
            case user(GoTrueHTTP.User)

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                if let value = try? container.decode(GoTrueHTTP.Session.self) {
                    self = .session(value)
                } else if let value = try? container.decode(GoTrueHTTP.User.self) {
                    self = .user(value)
                } else {
                    throw DecodingError.dataCorruptedError(in: container, debugDescription: "Failed to intialize `oneOf`")
                }
            }
        }

        private func makePostQuery(_ redirectURL: URL?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(redirectURL, forKey: "redirect_url")
            return encoder.items
        }
    }
}

extension Paths {
    public static var otp: Otp {
        Otp(path: "/otp")
    }

    public struct Otp {
        /// Path: `/otp`
        public let path: String

        public func post(redirectURL: URL? = nil, _ body: GoTrueHTTP.OTPParams? = nil) -> Request<Void> {
            .post(path, query: makePostQuery(redirectURL), body: body)
        }

        private func makePostQuery(_ redirectURL: URL?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(redirectURL, forKey: "redirect_url")
            return encoder.items
        }
    }
}

public enum Paths {}
