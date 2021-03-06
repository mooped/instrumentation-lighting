//
//  Light.swift
//  instrumentation-lighting
//
//  Created by Matt Lloyd on 22/09/2017.
//
//

import Foundation

enum ChannelState: String, Codable {
  case ON
  case OFF
  case TOGGLE
}

struct Building {
  var id: Int
  var name: String
}

struct Floor {
  var id: Int
  var name: String
  var level: Int
  var buildingId: Int
}

struct Room {
  var id: Int
  var name: String
  var floorId: Int
}

struct Light {
  var id: Int
  var name: String?
  var roomId: Int
  var outputChannelId: Int
}

struct OutputChannel {
  var id: Int
  var channel: Int
  var controllerId: Int
}

struct InputChannel {
  var id: Int
  var channel: Int
  var controllerId: Int
  var patternId: Int?
}

struct Pattern {
  var id: Int
  var name: String
  var nextPatternId: Int?
  var timeout: Int?
}

struct Controller {
  var id: Int
  var name: String
  var roomId: Int
}

struct LigthPattern {
  var lightId: Int
  var patternId: Int
  var state: ChannelState
}

struct Lighting {
  var buildings = [Building]()
  var floors = [Floor]()
  var rooms = [Room]()
  var lights = [Light]()
  var outputChannels = [OutputChannel]()
  var inputChannels = [InputChannel]()
  var controllers = [Controller]()
  var patterns = [Pattern]()
  var lightPatterns = [LigthPattern]()
}

var lighting = Lighting()

class CurrentLightState {
  let id: Int
  var state: ChannelState
  
  init(id: Int, state: ChannelState) {
    self.id = id
    self.state = state
  }
}

extension CurrentLightState: CustomStringConvertible {
  var description: String {
    get {
      return "\nCurrentLightState(id: \(id) state: \(state))"
    }
  }
}
