# create Admin
User.create(username: 'admin',
            email: 'admin@admin.com',
            password: 'password',
            admin: true)

# create Users
3.times do |i|
  User.create(username: Faker::Name.name,
              email: "user_#{i}@example.com",
              password: 'password',
              admin: false)
end

# create Categories
5.times do
  Category.create(name: Faker::Hobby.activity)
end

# create Articles
5.times do |i|
  Article.create(title: "Article_#{i}",
                 description: Faker::Book.title,
                 user_id: User.find(User.pluck(:id).sample).id,
                 category_id: Category.find(Category.pluck(:id).sample).id)
end
