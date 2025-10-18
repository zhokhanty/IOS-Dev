//
//  main.swift
//  lab3
//
//  Created by Zhalgas Bagytzhan on 03.10.2025.
//

import Foundation

"""
Part 1: Product Models (35 points)
"""

// 1.1 Product Struct

enum ProductError: Error {
    case invalidPrice
}

struct Product {
    var id: String
    var name: String
    var price: Double
    var category: Category
    var description: String
    
    enum Category: String, CaseIterable {
        case electronics
        case clothing
        case food
        case books
    }
    
    var displayPrice: String {
        return String(format: "$%.2f", price)
    }
    
    init(id: String, name: String, price: Double, category: Category, description: String) throws {
        guard price > 0 else {
            throw ProductError.invalidPrice
        }
        self.id = id
        self.name = name
        self.price = price
        self.category = category
        self.description = description
    }
}

// 1.2 CartItem Struct

struct cartItem {
    var product: Product
    var quantity: Int
    
    var subTotal: Double {
        return product.price * Double(quantity)
    }
    
    mutating func updateQuantity(_ newQuantity: Int) {
        guard newQuantity > 0 else {
            print("Quantity must be greater than 0")
            return
        }
        quantity = newQuantity
        print("Quantity updated to \(quantity)")
    }
    
    mutating func increaseQuantity(_ amount: Int = 1) {
        quantity += amount
        print("Quantity increased by \(amount)")
    }
}

"""
Part 2: Shopping Cart Class (35 points)
"""

class ShoppingCart {
    private(set) var items: [cartItem]
    var discountCode: String?
    
    init() {
        self.items = []
        self.discountCode = nil
    }
    
    func addItem(product: Product, quantity: Int = 1) {
        guard let existingItem = items.firstIndex(where: { $0.product.id == product.id }) else {
            items.append(cartItem(product: product, quantity: quantity))
            print("Item added to cart")
            return
        }
        items[existingItem].increaseQuantity()
        print("Item quantity updated in cart")
    }
    
    func removeItem(productId: String) {
        guard let index = items.firstIndex(where: { $0.product.id == productId }) else {
            print("Item not found in cart")
            return
        }
        items.remove(at: index)
        print("Item removed from cart")
    }
    
    func clearCart() {
        items.removeAll()
        print("Cart cleared")
    }
    
    func subtotal() -> Double {
        return items.reduce(0) { $0 + $1.subTotal }
    }
    
    func discountAmount() -> Double {
        guard let discountCode = discountCode else { return 0 }
        switch discountCode {
        case "SAVE10":
            return subtotal() * 0.1
        case "SAVE20":
            return subtotal() * 0.2
        default:
            return 0
        }
    }
    
    var total: Double {
        return subtotal() - discountAmount()
    }
    
    var itemCount: Int {
        return items.reduce(0) { $0 + $1.quantity }
    }
    
    var isEmpty: Bool {
        if itemCount == 0 {
            return true
        }
        return false
    }
}

"""
Part 3: Order & Address (20 points)
"""

// 3.1 Address Struct

struct Address {
    var street: String
    var city: String
    var zipCode: String
    var country: String
    
    var formattedAddress: String {
        return "\(street)\n\(city), \(zipCode)\n\(country)"
    }
}

// 3.2 Order struct

struct Order {
    var orderId: Int
    var items: [cartItem]
    var subtotal: Double
    var discountAmount: Double
    var total: Double
    var timestamp: Date
    var shippingAddress: Address
    
    init(from cart: ShoppingCart, shippingAddress: Address){
        self.orderId = Int.random(in: 1000..<10000)
        self.items = cart.items
        self.subtotal = cart.subtotal()
        self.discountAmount = 0
        self.total = cart.total
        self.timestamp = Date()
        self.shippingAddress = shippingAddress
    }
    
    var itemsCount: Int {
        return items.count
    }
    
}

"""
Part 4: Testing & Demonstrations (10 points)
"""

let laptop = try Product(
    id: "LAPTOP-001",
    name: "MacBook Air (M2) 13-inch",
    price: 1099.99,
    category: .electronics,
    description: "The MacBook Air M2 (13-inch) is a lightweight, fanless laptop with a 13.6-inch Liquid Retina display, powered by the Apple M2 chip for fast performance and all-day battery life"
)

let book = try Product(
    id: "BOOK-001",
    name: "Harry Potter and the Sorcerer's Stone",
    price: 14.99,
    category: .books,
    description: "Harry Potter and the Sorcerer's Stone is the first book in the series where Harry discovers he's a wizard and attends Hogwarts School of Witchcraft and Wizardry, leading to adventures with friends and discovery of his true destiny"
)

let headphones = try Product(
    id: "HEADPHONES-001",
    name: "Anker Soundcore Life Q20 Hybrid Active Noise Cancelling Headphones",
    price: 79.99,
    category: .electronics,
    description: ""
)

let cart = ShoppingCart()

cart.addItem(product: laptop, quantity: 1)
cart.addItem(product: book, quantity: 2)

cart.addItem(product: laptop, quantity: 1)

print("Subtotal: \(cart.subtotal())")
print("Item count: \(cart.itemCount)")

cart.discountCode = "SAVE10"
print("Total with discount: \(cart.total)")

cart.removeItem(productId: book.id)
print("Total after removing book: \(cart.total)")

func modifyCart(_ cart: ShoppingCart) {
    cart.addItem(product: headphones, quantity: 1)
}
modifyCart(cart)

let item1 = cartItem(product: laptop, quantity: 1)
var item2 = item1
item2.updateQuantity(5)

let address = Address(
    street: "123 Main Street",
    city: "Anytown",
    zipCode: "12345",
    country: "USA"
)

let order = Order(from: cart, shippingAddress: address)

cart.clearCart()

print("Order items count: \(order.itemsCount)")
print("Cart items count: \(cart.itemCount)")
