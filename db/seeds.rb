# db/seeds.rb
# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create_with(
  first_name: 'Neil',
  last_name: 'Spackman',
  password: 'example1'
).find_or_create_by!(email: 'n.spackman89@gmail.com')

Property.create!(
  name: 'primary',
  street_address: '615 N 100 W #4',
  city: 'Provo',
  state: 'UT',
  zip: 84_601
)

UserProperty.create!(
  user_id: 1,
  property_id: 1
)

Room.create!(
  property_id: 1,
  name: 'bedroom 1',
  category: 'bedroom'
)

Room.create!(
  property_id: 1,
  name: 'kitchen 1',
  category: 'kitchen'
)

10.times do
  Item.create!(
    room_id: 1,
    name: 'Book',
    date: 'some date',
    price: 10.01,
    image: 'some book image url'
  )
end

10.times do
  Item.create!(
    room_id: 2,
    name: 'fork',
    date: 'some date',
    price: 5.01,
    image: 'some fork image url'
  )
end
