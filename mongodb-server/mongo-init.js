db.createUser({
  user: "admin",
  pwd: "123456a",
  roles: [
		{ role: "readWrite", db: "admin"},
        { role: "userAdminAnyDatabase", db: "admin" },
        { role: "readWriteAnyDatabase", db: "admin" }
  ]
});

db = db.getSiblingDB('productsdb');
db.createCollection('dummyCollection');
db.dummyCollection.insertOne({ initialized: true });