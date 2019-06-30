# Fizzbuzz app

## Usage

Clone this project.

```ruby
git clone git@github.com:alexpapworth/fizzbuzz-app.git
```

Run the database migrations.

```ruby
cd fizzbuzz-app
rails db:migrate
```
The numbers and fizzbuzz results are generated on the fly depending on your page number.

```ruby
def check_fizzbuzz(number)
	"#{"fizz" if number.to_i % 3 == 0}#{'buzz' if number.to_i % 5 == 0}".capitalize
end
```


## Features

### Signup
To create a new account, click the Sign Up button. The app doesn't use passwords, and a username will be automatically assigned for you.

[image of sign up]

### Login and out
Once an account is signed up, you can log into it again by entering the name. Or, select a user from the list.
Note that the same user can be logged into multiple browsers at once. Sessions persist on each browser until you log out, or clear your cookies. Shut down the browser to test it out!

### Favourite a number
Click the star to favourite a number. This will persit between logins. You can see a tally of how many users favourited a number on the last column.
