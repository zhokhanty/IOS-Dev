# Shopping Cart System - Lab3

Why I chose a class for ShoppingCart

I used a class for ShoppingCart because it represents a shared, mutable entity that multiple parts of the program can modify and reference. A shopping cart naturally behaves like a single, ongoing session object that changes as a user adds or removes items. Classes in Swift have reference semantics, meaning that when a ShoppingCart instance is passed to a function or assigned to a new variable, both references point to the same object in memory. This allows updates made inside one function (like addItem or clearCart) to persist outside of it, mimicking how a real-world cart maintains its state throughout a shopping session.

## Why I chose structs for Product and Order
    Product and Order were implemented as structs because they are value types that represent independent, immutable data snapshots. Each Product is defined by its attributes (ID, name, price, category, description), and when copied or assigned, it should not affect the original. This prevents unwanted side effects — modifying a product in one part of the code won’t change it elsewhere.
    Similarly, an Order should represent a finalized snapshot of a user’s cart at a specific time. Once created, it should not share mutable references with the cart. Using a struct ensures the order’s contents are copied, preserving historical accuracy even if the cart is cleared later.

## Example where reference semantics matter
    cart.clearCart()


## Example where reference semantics matter
