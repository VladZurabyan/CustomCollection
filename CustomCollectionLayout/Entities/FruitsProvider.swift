import Foundation

struct FruitsProvider {
    static func get() -> [Fruit] {
        return [
            Fruit(name: "Red Apple", icon: #imageLiteral(resourceName: "apple"), text: "Apple, (Malus domestica), fruit of the domesticated tree Malus domestica (family Rosaceae), one of the most widely cultivated tree fruits. The apple is a pome (fleshy) fruit, in which the ripened ovary and surrounding tissue both become fleshy and edible."),
            Fruit(name: "BananaBananaBananaBananaBananaBanana", icon: #imageLiteral(resourceName: "banana"), text: "asdsadasdsadasdasd"),
            Fruit(name: "Garnet", icon: #imageLiteral(resourceName: "garnet"), text: "asdsadsadsad"),
            Fruit(name: "Grapes", icon: #imageLiteral(resourceName: "grapes"), text: "asdsadsadsad"),
            Fruit(name: "Green Apple", icon: #imageLiteral(resourceName: "green_apple"), text: "asdsadsadsad"),
            Fruit(name: "Kiwi", icon: #imageLiteral(resourceName: "kiwi"), text: "asdsadsadsad"),
            Fruit(name: "Green Pears", icon: #imageLiteral(resourceName: "green_pears"), text: "asdsadsadsad"),
            Fruit(name: "Mango", icon: #imageLiteral(resourceName: "mango"), text: "asdsadsadsad"),
            Fruit(name: "Orange", icon: #imageLiteral(resourceName: "orange"), text: "asdsadsadsad"),
            Fruit(name: "Sliced Mango", icon: #imageLiteral(resourceName: "mango2"), text: "asdsadsadsad"),
            Fruit(name: "Pears", icon: #imageLiteral(resourceName: "pears"), text: "asdsadsadsad"),
            Fruit(name: "Pineapple", icon: #imageLiteral(resourceName: "pineapple"), text: "asdsadsadsad")
        ]
    }
}
