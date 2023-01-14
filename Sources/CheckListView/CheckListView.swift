//
//  CheckListView.swift
//  CheckList
//
//  Created by SwiftMan on 2023/01/14.
//

import SwiftUI
import IdentifiableIndices

public struct CheckListView: View {
  @ObservedObject
  private var checkListBinder: CheckListBinder
  
  private let style: CheckBoxImageStyle

  private var onChanged: ([CheckBox]) -> Void
  
  public init(checkBoxes: [CheckBox],
              style: CheckBoxImageStyle,
              isMultipleSelect: Bool = false,
              onChanged: @escaping ([CheckBox]) -> Void) {
    self.checkListBinder = CheckListBinder(checkBoxes: checkBoxes,
                                           isMultipleSelect: isMultipleSelect)
    self.style = style
    self.onChanged = onChanged
  }
  
  public var body: some View {
    List {
      ForEach($checkListBinder.checkBoxes) { index, checkBox in
        CheckBoxView(checkBox: checkBox, style: style)
          .onTapGesture {
            let updatedAllData = self.checkListBinder.toggle(at: index)
            onChanged(updatedAllData)
          }
      }
    }
  }
}

struct CheckListView_Previews: PreviewProvider {
  struct CheckListViewHolder: View {
    var body: some View {
      CheckListView(checkBoxes: [
        CheckBox(id: UUID(),
                 checked: true,
                 title: "true"),
        CheckBox(id: UUID(),
                 checked: false,
                 title: "false"),
      ], style: .systemStyle,
                    onChanged: {_ in })
    }
  }
  
  static var previews: some View {
    CheckListViewHolder()
  }
}
