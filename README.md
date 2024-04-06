# Shopping List - Web Application

## Introduction
This is a web application developed with Ruby on Rails that allows you to manage your shopping lists efficiently. With this application, you can add products pending purchase, mark them as purchased and view them easily.

## Used technology

- **Ruby 3.2.3**
- **Rails 7.1.3**
- **SQLite**
- **ViewComponents**
- **RSpec**
- **Bulma.io**

## Previous requirements
Before you begin, make sure you have the following installed on your system:
- Ruby 3.2.3
- Rails 7.1.3
- SQLite

## Project Settings
1. Clone this repository to your local machine using the following command:
     ```
     git clone https://github.com/tu_usuario/lista-de-compras.git
     ```

2. Access the project directory:
     ```
     cd shopping-list
     ```

3. Install the necessary gems using Bundler:
     ```
     bundle install
     ```

4. Create the database and run the migrations:
     ```
     rails db:create
     rails db:migrate
     ```

5. Optional: If you want to add some example data for the store sections, you can run:
     ```
     rails db:seed
     ```

## Project execution
Once you have configured the project correctly, you can start the Rails server with the following command:

```
rails server
```
This will start the server on your local machine and you can access the application from your web browser by visiting the address `http://localhost:3000`.

## Use of the Application
1. **Product List**: On the main page of the application, you will be able to see a list of all the products pending purchase grouped by date.
2. **Add a New Product**: To add a new product to the list, simply click on the "Add Product" button and fill out the corresponding form.
3. **Mark Product as Purchased**: Once you have purchased a product, you can mark it as purchased by clicking the "Mark as Purchased" button next to the product in the list.

And that's it! Now you are ready to start using the Shopping List application.
