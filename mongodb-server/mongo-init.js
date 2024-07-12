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
db.createCollection('productTypes'); // Tipos de producto
db.createCollection('products'); // Productos
db.createCollection('orders'); // Comandas
db.createCollection('productsOrders'); // Productos encontrados en comandas
db.createCollection('ordersPayment'); // Pagos de comandas
db.createCollection('productData'); // Imágenes de productos

/*
	Inserciones por defecto para la base de datos
*/
db.productTypes.insertMany([
    { typeCode: 'DESSERT', name: 'Dessert' },
    { typeCode: 'SEAFOOD', name: 'Seafood' },
    { typeCode: 'VEG', name: 'Veggie' },
    { typeCode: 'FRUIT', name: 'Fruit' },
    { typeCode: 'DRINK', name: 'Drink' },
    { typeCode: 'STARTER', name: 'Starter' },
    { typeCode: 'SANDWICH', name: 'Sandwich' },
    { typeCode: 'ENTREE', name: 'Entrée' }
]);

db.products.insertMany([
    { productCode: 'CHOCCK1', name: 'Chocolate Cake', productType: 'DESSERT', price: 4.50, active: true },
    { productCode: 'ICREAM1', name: 'Ice Cream', productType: 'DESSERT', price: 3.00, active: true },
    { productCode: 'GRILSAL1', name: 'Grilled Salmon', productType: 'SEAFOOD', price: 12.00, active: true },
    { productCode: 'SHRMP1', name: 'Shrimp Cocktail', productType: 'SEAFOOD', price: 8.50, active: true },
    { productCode: 'VEGBUR1', name: 'Veggie Burger', productType: 'VEG', price: 6.00, active: true },
    { productCode: 'CAESAL', name: 'Caesar Salad', productType: 'VEG', price: 5.50, active: true },
    { productCode: 'APPLE', name: 'Apple', productType: 'FRUIT', price: 1.00, active: true },
    { productCode: 'ORANGE', name: 'Orange', productType: 'FRUIT', price: 1.00, active: true },
    { productCode: 'DCOLA1', name: 'Cola', productType: 'DRINK', price: 1.50, active: true },
    { productCode: 'DWAT1', name: 'Water', productType: 'DRINK', price: 1.00, active: true },
    { productCode: 'FRIESFR', name: 'French Fries', productType: 'STARTER', price: 2.50, active: true },
    { productCode: 'SPRINGROL', name: 'Spring Rolls', productType: 'STARTER', price: 4.00, active: true },
    { productCode: 'SANDWICH1', name: 'Ham Sandwich', productType: 'SANDWICH', price: 3.50, active: true },
    { productCode: 'SANDWICH2', name: 'Chicken Sandwich', productType: 'SANDWICH', price: 4.00, active: true },
    { productCode: 'STEAK', name: 'Steak', productType: 'ENTREE', price: 15.00, active: true },
    { productCode: 'PASTA', name: 'Pasta', productType: 'ENTREE', price: 10.00, active: true }
]);

db.orders.insertMany([
    { orderCode: 'ORD000000000001', paid: false },
    { orderCode: 'ORD000000000002', paid: true },
    { orderCode: 'ORD000000000003', paid: false },
    { orderCode: 'ORD000000000004', paid: true }
]);

db.productsOrders.insertMany([
    { productCode: 'CHOCCK1', orderId: 1, quantity: 2 },
    { productCode: 'VEGBUR1', orderId: 1, quantity: 1 },
    { productCode: 'DCOLA1', orderId: 1, quantity: 3 },
    { productCode: 'GRILSAL1', orderId: 2, quantity: 1 },
    { productCode: 'FRIESFR', orderId: 2, quantity: 2 },
    { productCode: 'ORANGE', orderId: 2, quantity: 1 },
    { productCode: 'ICREAM1', orderId: 3, quantity: 1 },
    { productCode: 'DWAT1', orderId: 3, quantity: 2 },
    { productCode: 'SANDWICH2', orderId: 4, quantity: 1 },
    { productCode: 'SPRINGROL', orderId: 4, quantity: 1 }
]);

db.ordersPayment.insertMany([
    { orderId: 2, amount: 30.00, paymentType: 'CARD' },
    { orderId: 4, amount: 20.00, paymentType: 'PAYPAL' }
]);