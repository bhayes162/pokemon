//
//  PokeAnnotation.swift
//  Pokemon
//
//  Created by Bryan Hayes on 11/4/17.
//  Copyright © 2017 ZappyCode. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class PokeAnnotation : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var pokemon : Pokemon
    
    init(coord: CLLocationCoordinate2D, pokemon: Pokemon) {
        self.coordinate = coord
        self.pokemon = pokemon
    }
    
}
