//
//  CoreDataHelp.swift
//  Pokemon
//
//  Created by Bryan Hayes on 11/2/17.
//  Copyright © 2017 ZappyCode. All rights reserved.
//

import Foundation
import UIKit
import CoreData

func addAllPokemon() {
    
    createPokemon(name: "Bats", imageName: "bat-1")
    createPokemon(name: "Hot Dog", imageName: "hot-dog")
    createPokemon(name: "Medal", imageName: "medal")
    createPokemon(name: "Helmet", imageName: "helmet")
    createPokemon(name: "Pants", imageName: "pants")
    createPokemon(name: "Shoe", imageName: "shoe")
    createPokemon(name: "Strike", imageName: "strike")
    createPokemon(name: "Trophy", imageName: "trophy")
    
    (UIApplication.shared.delegate as! AppDelegate).saveContext()
}

func createPokemon(name: String, imageName: String) {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let pokemon = Pokemon(context: context)
    pokemon.name = name
    pokemon.imageName = imageName
    //(UIApplication.shared.delegate as! AppDelegate).saveContext()
}

func getAllPokemon() -> [Pokemon] {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    do {
        let pokemons = try context.fetch(Pokemon.fetchRequest()) as! [Pokemon]
        
        if pokemons.count == 0 {
            addAllPokemon()
            return getAllPokemon()
        }
        
        return pokemons
        
    } catch{}
    return []
}


func getAllCaughtPokemons() -> [Pokemon] {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let fetchRequest = Pokemon.fetchRequest() as NSFetchRequest<Pokemon>
    
    fetchRequest.predicate = NSPredicate(format: "caught == %@", true as CVarArg)
    do {
        let pokemons = try context.fetch(fetchRequest) as [Pokemon]
        return pokemons
    } catch {}
    return []
}

func getAllUncaughtPokemons()  -> [Pokemon] {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let fetchRequest = Pokemon.fetchRequest() as NSFetchRequest<Pokemon>
    
    fetchRequest.predicate = NSPredicate(format: "caught == %@", false as CVarArg)
    do {
        let pokemons = try context.fetch(fetchRequest) as [Pokemon]
        return pokemons
    } catch {}
    return []
}
