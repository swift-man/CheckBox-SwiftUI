//
//  CheckBoxImageStyle.swift
//  CheckList
//
//  Created by SwiftMan on 2023/01/14.
//

import SwiftUI

public enum CheckBoxImageStyle: Equatable {
  case systemStyle
  case square
  case custom(selectedImage: Image, deselectedImage: Image)
  
  var selectedImage: Image {
    switch self {
    case .systemStyle:
      return Image(systemName: "checkmark")
    case .square:
      return Image(systemName: "checkmark.square.fill")
    case .custom(selectedImage: let selectedImage, deselectedImage: _):
      return selectedImage
    }
  }
  
  var deselectedImage: Image? {
    switch self {
    case .systemStyle:
      return nil
    case .square:
      return Image(systemName: "square")
    case .custom(selectedImage: _, deselectedImage: let deselectedImage):
      return deselectedImage
    }
  }
}
