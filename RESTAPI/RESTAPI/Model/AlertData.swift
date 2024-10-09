//
//  AlertData.swift
//  RESTAPI
//
//  Created by Nivedha Rajendran on 09.10.24.
//
import Foundation

struct AlertData: Identifiable {
    var id = UUID()
    var title: String
    var message: String
    var dismissButton: String
}
