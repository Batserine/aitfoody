# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Initial Data for Role
@admin = Role.create(name: "Admin")
@reviewer = Role.create(name: "Reviewer")
@user = Role.create(name: "User")

# UPDATE users SET firstname = 'admin', lastname = 'admin', sex = 'male', ban_status = '0',role_id = 1 WHERE email = 'admin@ait.asia';

# Admin
User.create(email: "admin@ait.asia",
            password: "123456",
            password_confirmation: "123456",
            role: @admin)
# Reviewer
User.create(email: "reviewer@ait.asia",
            password: "123456",
            password_confirmation: "123456",
            role: @reviewer)
# User
User.create(email: "user@ait.asia",
            password: "123456",
            password_confirmation: "123456",
            role: @user)