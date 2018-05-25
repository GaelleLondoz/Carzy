Review.destroy_all
Booking.destroy_all
Vehicule.destroy_all
User.destroy_all

require 'faker'

joy = User.create!(
  first_name: "Joy",
  last_name: "Navi",
  remote_photo_url: "",
  email: "joy@joy.com",
  password: "123456",
)

mg = User.create!(
  first_name: "mg",
  last_name: "ayoub",
  remote_photo_url: "",
  email: "mg@mg.com",
  password: "123456"
)

michael = User.create!(
  first_name: "michael",
  last_name: "lepecq",
  remote_photo_url: "",
  email: "mike@mike.com",
  password: "123456",
)

gaelle = User.create!(
  first_name: "gaelle",
  last_name: "londoz",
  remote_photo_url: "",
  email: "gaelle@gaelle.com",
  password: "123456",
)

# -------------------------------------------

category = [ "Van", "City car", "SUV", "Motorbike", "Scooter", "Convertible", "4WD" ]
transmission = ['Manual', 'Automatic']
fuel = ['Diesel', 'Unleaded', 'Electric']
brands = ['toyota', 'ford', 'peugeot', 'honda', 'jeep', 'gmc']
brand_model = {
  'toyota' => ['corolla'],
  'ford' => ['fiesta'],
  'peugeot' => ['205'],
  'honda' => ['civic'],
  'jeep' => ['cherookee'],
  'gmc' => ['canyon'],
}

addresses = ["5333 Casgrain", "St. Laurant", "Downtown Montreal", "Rue St. Denis"]

[gaelle, michael, mg, joy].each do |user|

    4.times do | |

      brand = brands[Faker::Number.between(0, 5)]

      vehicule = Vehicule.create!(
        user: user,
        brand: brand,
        model: brand_model[brand][0], # FIXME: between?
        mileage: Faker::Number.between(0, 200000),
        year:  Faker::Date.birthday.year,
        number_of_seats: Faker::Number.between(2, 5),
        price_per_day: Faker::Number.between(10, 300),
        fuel_type: fuel[Faker::Number.between(0, 2)],
        transmission: transmission[Faker::Number.between(0, 1)],
        category: category[Faker::Number.between(0, 6)],
        description: Faker::Lorem.paragraph,
        location: addresses.sample
        # longitude: Faker::Address.longitude,
        # latitude: Faker::Address.latitude,
      )

      Review.create!(
         vehicule: vehicule,
         rating: Faker::Number.between(0, 5),
         content: Faker::Lorem.sentence(4)
      )
  end
end
