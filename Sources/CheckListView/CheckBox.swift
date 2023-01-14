//
//  CheckBox.swift
//  CheckList
//
//  Created by SwiftMan on 2023/01/14.
//

import Foundation

public struct CheckBox: Hashable, Identifiable {
  public let id: UUID
  public var checked: Bool
  public var title: String
  
  public init(id: UUID = UUID(),
              checked: Bool,
              title: String) {
    self.id = id
    self.checked = checked
    self.title = title
  }
}
