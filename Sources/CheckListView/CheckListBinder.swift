//
//  CheckListBinder.swift
//  CheckList
//
//  Created by SwiftMan on 2023/01/14.
//

import Combine

public class CheckListBinder: ObservableObject {
  @Published
  var checkBoxes: [CheckBox]
  
  let isMultipleSelect: Bool
  
  public init(checkBoxes: [CheckBox], isMultipleSelect: Bool) {
    self.checkBoxes = checkBoxes
    self.isMultipleSelect = isMultipleSelect
  }
  
  func toggle(at index: Int) -> [CheckBox] {
    if isMultipleSelect {
      checkBoxes[index].checked.toggle()
      return checkBoxes
    }
    
    return toggleSingle(at: index)
  }
  
  private func toggleSingle(at index: Int) -> [CheckBox] {
    for i in 0 ..< checkBoxes.count {
      if i == index {
        checkBoxes[index].checked.toggle()
      } else {
        checkBoxes[i].checked = false
      }
    }
    return checkBoxes
  }
}
