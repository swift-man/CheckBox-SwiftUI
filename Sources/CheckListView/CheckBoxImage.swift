//
//  CheckBoxImage.swift
//  CheckList
//
//  Created by SwiftMan on 2023/01/14.
//

import SwiftUI

public struct CheckBoxImage: View {
  @Binding
  var checked: Bool
  
  let style: CheckBoxImageStyle
  
  public init(checked: Binding<Bool>, style: CheckBoxImageStyle) {
    self._checked = checked
    self.style = style
  }
  
  public var body: some View {
    image(checked: checked, style: style)
      .foregroundColor(checked ? Color.blue : Color.secondary)
      .onTapGesture {
        self.checked.toggle()
      }
  }
  
  @ViewBuilder
  private func image(checked: Bool, style: CheckBoxImageStyle) -> some View {
    checked ? style.selectedImage : style.deselectedImage
  }
}

struct CheckBoxImage_Previews: PreviewProvider {
  struct CheckBoxImageHolder: View {
    @State var checked = true
    
    var body: some View {
      CheckBoxImage(checked: $checked, style: .square)
    }
  }
  
  static var previews: some View {
    CheckBoxImageHolder()
  }
}
