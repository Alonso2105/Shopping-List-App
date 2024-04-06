return unless StoreSecction.any?

products_by_store_secction = {
  meat: ['Beef', 'Chicken', 'Pork', 'Lamb', 'Turkey'],
  dairy: ['Milk', 'Cheese', 'Yogurt', 'Butter', 'Cream'],
  bakery: ['Bread', 'Bagel', 'Croissant', 'Muffin', 'Donut'],
  food: ['Rice', 'Pasta', 'Cereal', 'Soup', 'Sauce'],
  pharmacy: ['Medicine', 'Vitamins', 'Bandages', 'First Aid Kit', 'Antiseptic'],
  electronics: ['Smartphone', 'Laptop', 'Tablet', 'Headphones', 'Smartwatch'],
  clothing: ['T-shirt', 'Jeans', 'Dress', 'Jacket', 'Shoes'],
  home: ['Bedding', 'Furniture', 'Kitchenware', 'Decor', 'Appliances'],
  sports: ['Basketball', 'Soccer Ball', 'Yoga Mat', 'Dumbbells', 'Running Shoes'],
  books: ['Novel', 'Non-fiction', 'Cookbook', 'Children Book', 'Biography'],
  toys: ['Doll', 'Action Figure', 'Puzzle', 'Board Game', 'Building Blocks'],
  beauty: ['Skincare', 'Makeup', 'Haircare', 'Perfume', 'Nail Polish']
}
store_names = ["SuperMart", "Fresh Foods", "MarketBasket", "CityMarket", "Family Fare"]

StoreSecction.find_each do |store_section|
  new_products = products_by_store_secction[store_section.name.downcase.to_sym]
  next unless new_products

  new_products.each do |product|
    Product.create(
      name: product,
      purchase_date: Date.now,
      store_name: store_names.sample,
      store_section: store_section,
      quantity: rand(1..10)
    )
  end
end