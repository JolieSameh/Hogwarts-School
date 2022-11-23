# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
pepper = nil
cost = 10
password = "avada kedavra"
# encryptedPassword = ::BCrypt::Password.create("#{password}#{pepper}", :cost => cost).to_s

User.insert!([
  
  {
    name: "Dumbledore the great",
    email: "Dumbledore@great.com",
    password: "avada kedavra",
    password_confirmation: "avada kedavra",
    # encrypted_password: encryptedPassword,
    role: "1",
    bio: "",
    house: "",
    birthday: "1999-7-20"
  }
])


# user = User.new

# user.name = "Dumbledore the great"
# user.email = "Dumbledore@great.com"
# user.encrypted_password = "avada kedavra"
# # user.password = "avada kedavra"
# # user.password_confirmation = "avada kedavra"
# user.role= "1"
# user.bio= ""
# user.house= ""
# user.birthday= "1999-7-20"
# user.save(validate: false)
