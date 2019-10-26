# Toy Tracker
Toy Tracker is a simple Content Management System to track your kids' toys.  A user can register and then store information about their child's ever-growing toy collection.  

## Usage
To use Toy Tracker, just clone, run `bundle install`, then run `rake db:migrate` and finally run `shotgun`.

## Description
The requirements of this app were to:
- Build an MVC Sinatra application.
- Use ActiveRecord with Sinatra.
- Use multiple models.
- Use at least one has_many relationship on a User model and one belongs_to relationship on another model.
- Must have user accounts - users must be able to sign up, sign in, and sign out.
- Validate uniqueness of user login attribute (username or email).
- Once logged in, a user must have the ability to create, read, update and destroy the resource that belongs_to user.
- Ensure that users can edit and delete only their own resources - not resources created by other users.
- Validate user input so bad data cannot be persisted to the database.
- BONUS: Display validation failures to user with error messages.

## License
This application is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
