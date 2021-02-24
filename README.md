# Final capstone project : Easy Rent back-end API

![Microverse](https://img.shields.io/badge/-Microverse-6F23FF?style=for-the-badge)

## Description

Easy Rent back-end API is a Ruby On Rails API only server. It contains four tables :

- Users table.
- Rents table.
- Cars table.
- Sessions table.
  This project works as an external API for the Easy Rent Web app to store and fetch data. Please find below the API Endpoints provided.

## Library Directory 📙

| Contents                        |
| ------------------------------- |
| [Api Endpoints](#api-endpoints) |
| [Built With](#built-with-🛠)     |
| [Setup](#setup-⏳)              |
| [Testing](#testing-⚙️)          |
| [Authors](#authors)             |
| [License](#license)             |

## Api Endpoints

<table><thead>
<tr>
<th>Endpoint</th>
<th style="text-align: right">Functionality</th>
</tr>
</thead><tbody>
<tr>
<td>GET /api/v1/cars</td>
<td style="text-align: right">Get all cars</td>
</tr>
<tr>
<td>POST /api/v1/cars</td>
<td style="text-align: right">Create a new car</td>
</tr>
<tr>
<td>PATCH /api/v1/cars/:id</td>
<td style="text-align: right">Edit car</td>
</tr>
<tr>
<td>DELETE /api/v1/cars/:id</td>
<td style="text-align: right">Delete car</td>
</tr>
<td>GET /rents</td>
<td style="text-align: right">Get all rents</td>
</tr>
<tr>
<td>PATCH /rents/:id</td>
<td style="text-align: right">Edit rent</td>
</tr>
<tr>
<td>DELETE /rents/:id</td>
<td style="text-align: right">Delete rent</td>
</tr>
<tr>
<td>GET  /users/:user_id/rents</td>
<td style="text-align: right">Get user rents</td>
</tr>
<tr>
<td>POST /users/:user_id/rents</td>
<td style="text-align: right">Create a new user rent</td>
</tr>
<tr>
<td>DELETE /users/:user_id/rents/:id</td>
<td style="text-align: right">Delete user rent</td>
</tr>
<tr>
<td>POST /users</td>
<td style="text-align: right">Create a new user </td>
</tr>
<tr>
<td>GET /users/:id</td>
<td style="text-align: right">Get user </td>
</tr>
<tr>
<td>PATCH /users/:id</td>
<td style="text-align: right">Update user</td>
</tr>
<tr>
<td>DELETE /users/:id</td>
<td style="text-align: right">Delete user</td>
</tr>
<tr>
<td>POST /login</td>
<td style="text-align: right">Login</td>
</tr>
<tr>
<td>POST /logout</td>
<td style="text-align: right">Logout</td>
</tr>
<tr>
<td>GET /logged_in</td>
<td style="text-align: right">Check if user is logged In</td>
</tr>
</tbody></table>

## Built With 🛠

```
- Ruby On Rails
- Ruby
```

## Setup ⏳

> Follow these steps below to get my Application working

1. - [ ] Open your `Terminal`
2. - [ ] Navigate to the directory where you will like to install the repo by running `cd FOLDER-NAME`
3. - [ ] Run `git clone git@github.com:khalilhamdii/easy-rent-api.git` in the terminal to download.
4. - [ ] Run `cd easy-rent-api` to enter directory
5. - [ ] Run `bundle install` to install Ruby Gems (<b>hint:</b> Mac users, if not working then run `sudo bundle install`)
6. - [ ] Before moving to the next step, open this file `config/database.yml` and make sure username and password match your local server username and password (they are set to default in this application).
7. - [ ] Run `yarn install --check-files` to check all the files.
8. - [ ] Run `rails db:create` to create a local database
9. - [ ] Run `rails db:migrate` to migrate the database
10. - [ ] Run `rails db:seed` to populate the database
11. - [ ] Run `http://localhost:3001/` in your browser to launch the rails API

## Testing ⚙️

> I have used [rspec](https://rspec.info/) testing tool, Factory Bot and Faker to test the models and the requests by creating test cases for every controller method. Please follow below to test my code

1. - [ ] Open `Terminal` again
2. - [ ] Run `cd easy-rent-api` to enter directory
3. - [ ] Run `rails db:create db:migrate RAILS_ENV=test` to migrate testing database
4. - [ ] Run `rspec` to start testing
5. - [ ] All tests will pass ✅

## Authors

### 👨‍💻 Khalil Hamdi

[![GitHub](https://img.shields.io/badge/-GitHub-000?style=for-the-badge&logo=GitHub&logoColor=white)](https://github.com/khalilhamdii) <br>
[![LINKEDIN](https://img.shields.io/badge/-LINKEDIN-0077B5?style=for-the-badge&logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/khalilhamdi/) <br>
[![EMAIL](https://img.shields.io/badge/-EMAIL-D14836?style=for-the-badge&logo=Mail.Ru&logoColor=white)](mailto:khaalil.hamdi@gmail.com) <br>
[![TWITTER](https://img.shields.io/badge/-TWITTER-1DA1F2?style=for-the-badge&logo=Twitter&logoColor=white)](https://twitter.com/Khalilhamdiii)

### 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/khalilhamdii/MyTodos).

### Show your support

Give a ⭐️ if you like this project!

### License

![Cocoapods](https://img.shields.io/cocoapods/l/AFNetworking?color=red&style=for-the-badge)
