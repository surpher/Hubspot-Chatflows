//
//  Hubspot_ChatflowsApp.swift
//  Hubspot-Chatflows
//

import HubspotMobileSDK
import SwiftUI

@main
struct Hubspot_ChatflowsApp: App {

  init() {
    HubspotManager.configure(
      portalId: "_PORTAL_ID_",
      hublet: "na1",
      defaultChatFlow: "default",
      environment: .production
    )
    HubspotManager.shared.enableLogging()
  }

  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
