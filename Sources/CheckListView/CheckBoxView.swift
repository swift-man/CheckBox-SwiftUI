//
//  CheckBoxView.swift
//  CheckList
//
//  Created by SwiftMan on 2023/01/14.
//

import SwiftUI

public struct CheckBoxView: View {
  @Binding
  private var checkBox: CheckBox
  
  private let style: CheckBoxImageStyle
  
  public init(checkBox: Binding<CheckBox>, style: CheckBoxImageStyle) {
    self._checkBox = checkBox
    self.style = style
  }
  
  public var body: some View {
    HStack(alignment: .firstTextBaseline) {
      Text(checkBox.title)
        .alignmentGuide(.trailing) { viewDimensions in
          viewDimensions[.trailing]
        }
      Spacer()
      CheckBoxImage(checked: $checkBox.checked, style: style)
      
    }
    .contentShape(Rectangle())
  }
}

struct CheckBoxView_Previews: PreviewProvider {
  struct CheckBoxViewHolder: View {
    @State var checkBox = CheckBox(id: UUID(),
                                   checked: true,
                                   title: "안녕")
    
    var body: some View {
      CheckBoxView(checkBox: $checkBox, style: .square)
    }
  }
  
  static var previews: some View {
    CheckBoxViewHolder()
  }
}
