User.create name: "admin", email: "admin@gmail.com", password: "12345678",
  password_confirmation: "12345678", admin: true

  Category.create! name: "Health", sort_order: 1
  Category.create! name: "Enterpeneur", sort_order: 2
