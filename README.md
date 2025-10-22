# Shopping Cart System - Lab3

## Why I chose a class for ShoppingCart?

I used a class for ShoppingCart because it represents a shared, mutable entity that multiple parts of the program can modify and reference. 
A shopping cart naturally behaves like a single, ongoing session object that changes as a user adds or removes items. 
Classes in Swift have reference semantics, meaning that when a ShoppingCart instance is passed to a function or assigned to a new variable, 
both references point to the same object in memory. 
This allows updates made inside one function (like addItem or clearCart) to persist outside of it, 
mimicking how a real-world cart maintains its state throughout a shopping session.

## Why I chose structs for Product and Order?

Product and Order were implemented as structs because they are value types that represent independent, immutable data snapshots. 
Each Product is defined by its attributes (ID, name, price, category, description), and when copied or assigned, it should not affect the original. 
This prevents unwanted side effects — modifying a product in one part of the code won’t change it elsewhere.
Similarly, an Order should represent a finalized snapshot of a user’s cart at a specific time. Once created, it should not share mutable references with the cart. 
Using a struct ensures the order’s contents are copied, preserving historical accuracy even if the cart is cleared later.

## Example where reference semantics matter
    cart.clearCart()
the cart becomes empty, but the previously created Order still retains its own copy of the items.
If ShoppingCart were a struct, changes in one copy wouldn’t propagate — meaning modifications 
like adding or removing items inside helper functions wouldn’t affect the main cart instance.

## Example where reference semantics matter
    var item2 = item1
    item2.updateQuantity(5)
item2 is a copy of item1, so updating item2 does not affect item1.
This demonstrates value semantics, where each struct instance maintains its own independent data. 
This behavior is important for ensuring that cart items or products don’t unintentionally modify each other.

## Challenges faced and how I solved them

One main challenge was managing mutability and shared state between the cart, products, and orders. 
Initially, I considered making everything a class, but that led to unintended shared references between Order and ShoppingCart. 
By switching Product and Order to structs, I isolated state effectively.
Another challenge was implementing error handling for invalid product prices. I solved this by adding a custom 
ProductError enum and throwing an exception when a price ≤ 0 is provided.
Finally, balancing readability with robustness required thoughtful naming and encapsulation — 
for example, making items a private(set) property in ShoppingCart to prevent unauthorized modification while still allowing read access.
