//
//  CustomLabelStyle.swift
//  TestSwiftUI
//
//  Created by Hải Đăng on 04/11/2023.
//
import SwiftUI

struct CustomLabelStyle: LabelStyle {
  @ScaledMetric private var iconWidth: Double = 40
  func makeBody(configuration: Configuration) -> some View {
    HStack(spacing: 0) {
      configuration.icon
        .imageScale(.large)
        .frame(width: iconWidth)
      configuration.title
    }
  }
}
