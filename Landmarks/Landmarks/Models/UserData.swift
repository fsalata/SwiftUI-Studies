//
//  UserData.swift
//  Landmarks
//
//  Created by Fábio Salata on 23/05/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
	@Published var showFavoritesOnly = false
	@Published var landmarks = landmarkData
}
