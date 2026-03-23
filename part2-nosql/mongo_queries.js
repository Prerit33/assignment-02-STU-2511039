// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  {
    _id: "elec_001",
    name: "Smart LED TV 55-inch",
    category: "Electronics",
    brand: "Samsung",
    price: 64999,
    specifications: {
      resolution: "4K UHD",
      smart_tv: true
    },
    warranty: {
      period: "2 years"
    }
  },
  {
    _id: "cloth_001",
    name: "Men's Cotton Shirt",
    category: "Clothing",
    brand: "Levi's",
    price: 1999,
    attributes: {
      material: "Cotton",
      fit: "Regular"
    },
    available_sizes: ["M", "L", "XL"]
  },
  {
    _id: "groc_001",
    name: "Whole Wheat Flour 5kg",
    category: "Groceries",
    brand: "Aashirvaad",
    price: 350,
    expiry_date: new Date("2026-09-01"),
    nutritional_info: {
      energy: "340 kcal"
    },
    ingredients: ["Wheat"]
  }
]);

// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});

// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { _id: "elec_001" },
  { $set: { discount_percent: 10 } }
);

// OP5: createIndex() — create an index on category field
db.products.createIndex({ category: 1 });
