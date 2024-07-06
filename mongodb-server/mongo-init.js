db.createUser({
  user: "admin",
  pwd: "123456a",
  roles: [
		{ role: "readWrite", db: "admin"},
        { role: "userAdminAnyDatabase", db: "admin" },
        { role: "readWriteAnyDatabase", db: "admin" }
  ]
});

/*
	Inicialización de base de datos y colecciones
*/
db = db.getSiblingDB('restaurantdb');
db.createCollection('productTypes');
db.createCollection('products');
db.createCollection('orders');
db.createCollection('productsOrders');
db.createCollection('ordersPayment');

/*
	Inserciones por defecto para la base de datos
*/
db.productTypes.insertMany([
    { id: 1, name: 'Dessert' },
    { id: 2, name: 'Seafood' },
    { id: 3, name: 'Veggie' },
    { id: 4, name: 'Fruit' },
    { id: 5, name: 'Drink' },
    { id: 6, name: 'Starter' },
    { id: 7, name: 'Sandwich' },
    { id: 8, name: 'Entrée' }
]);

db.products.insertMany([
    { id: 1, name: 'Chocolate Cake', productType: 1, price: 4.50, active: true },
    { id: 2, name: 'Ice Cream', productType: 1, price: 3.00, active: true },
    { id: 3, name: 'Grilled Salmon', productType: 2, price: 12.00, active: true },
    { id: 4, name: 'Shrimp Cocktail', productType: 2, price: 8.50, active: true },
    { id: 5, name: 'Veggie Burger', productType: 3, price: 6.00, active: true },
    { id: 6, name: 'Caesar Salad', productType: 3, price: 5.50, active: true },
    { id: 7, name: 'Apple', productType: 4, price: 1.00, active: true },
    { id: 8, name: 'Orange', productType: 4, price: 1.00, active: true },
    { id: 9, name: 'Cola', productType: 5, price: 1.50, active: true },
    { id: 10, name: 'Water', productType: 5, price: 1.00, active: true },
    { id: 11, name: 'French Fries', productType: 6, price: 2.50, active: true },
    { id: 12, name: 'Spring Rolls', productType: 6, price: 4.00, active: true },
    { id: 13, name: 'Ham Sandwich', productType: 7, price: 3.50, active: true },
    { id: 14, name: 'Chicken Sandwich', productType: 7, price: 4.00, active: true },
    { id: 15, name: 'Steak', productType: 8, price: 15.00, active: true },
    { id: 16, name: 'Pasta', productType: 8, price: 10.00, active: true }
]);

db.orders.insertMany([
    { id: 1, paid: false },
    { id: 2, paid: true },
    { id: 3, paid: false },
    { id: 4, paid: true }
]);

db.productsOrders.insertMany([
    { productId: 1, orderId: 1, quantity: 2 },
    { productId: 5, orderId: 1, quantity: 1 },
    { productId: 9, orderId: 1, quantity: 3 },
    { productId: 3, orderId: 2, quantity: 1 },
    { productId: 11, orderId: 2, quantity: 2 },
    { productId: 8, orderId: 2, quantity: 1 },
    { productId: 2, orderId: 3, quantity: 1 },
    { productId: 10, orderId: 3, quantity: 2 },
    { productId: 15, orderId: 4, quantity: 1 },
    { productId: 12, orderId: 4, quantity: 1 }
]);

db.ordersPayment.insertMany([
    { orderId: 2, amount: 30.00, paymentType: 'CARD' },
    { orderId: 4, amount: 20.00, paymentType: 'PAYPAL' }
]);