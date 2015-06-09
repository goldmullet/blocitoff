require 'faker'
  
  # Create an admin user
 admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
 )
 admin.skip_confirmation!
admin.save!

  10.times do 
    list = List.create!(
      name: Faker::Lorem.sentence,
      description: Faker::Lorem.sentence,
      user: admin
    )
    10.times do 
      item=Item.create!(
        list: list,
        name: Faker::Lorem.sentence
      )
    end
  end

 puts "Admin created"
 puts "#{Item.count} items created"
