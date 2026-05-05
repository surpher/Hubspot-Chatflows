//
//  ContentView.swift
//  Hubspot-Chatflows
//

import HubspotMobileSDK
import SwiftUI

/// Minimal repro for chatflow-switching bug in HubSpot Mobile Chat SDK for iOS.
///
/// Steps:
/// 1. Tap "Open default chatflow", send at least one message, dismiss the sheet.
/// 2. Tap "Open update chatflow".
/// 3. Observe that the "default" chatflow is presented instead of "update".
///
struct ContentView: View {
  @State private var presentedFlow: ChatFlow?

  var body: some View {
    VStack(spacing: 24) {
      Text("HubSpot Chatflow")
        .font(.title2)
        .bold()

      Button("Open \"`default`\" chatflow") {
        presentedFlow = .default
      }
      .buttonStyle(.borderedProminent)

      Button("Open \"`update`\" chatflow") {
        presentedFlow = .update
      }
      .buttonStyle(.borderedProminent)

      Divider()

      Button("Clear user data") {
        HubspotManager.shared.clearUserData()
      }
      .buttonStyle(.borderedProminent)

    }
    .padding()
    .sheet(item: $presentedFlow) { flow in
      HubspotChatView(
        chatFlow: flow.tag,
        dismissChat: {
          HubspotManager.shared.clearUserData()
        }
      )
        .presentationDragIndicator(.visible)
    }
  }
}

// MARK: - Preview

#Preview {
  ContentView()
}

// MARK: - Models

private enum ChatFlow: String, Identifiable {
  case `default`
  case update = "update_jobtag"

  var id: String { rawValue }
  var tag: String { rawValue }
}
