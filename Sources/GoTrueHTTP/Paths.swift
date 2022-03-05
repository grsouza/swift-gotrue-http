// Generated by Create API
// https://github.com/kean/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get

extension Paths {
  public static var settings: Settings {
    Settings(path: "/settings")
  }

  public struct Settings {
    /// Path: `/settings`
    public let path: String

    public var get: Request<GoTrueHTTP.SettingsResponse> {
      .get(path)
    }
  }
}

extension Paths {
  public static var verify: Verify {
    Verify(path: "/verify")
  }

  public struct Verify {
    /// Path: `/verify`
    public let path: String

    public func post(_ body: GoTrueHTTP.VerificationRequest? = nil) -> Request<
      GoTrueHTTP.VerificationResponse
    > {
      .post(path, body: body)
    }
  }
}

public enum Paths {}