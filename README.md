# Merch 

## A shop that sells products

### To do:

1. Define My Routes
 	- In `config/routes.rb` define RESTful routes for resources. 

2. Generate Controller for primary resource (product). 
	- Define actions for endpoints. 
	- CRUD products
		- Read - Before I can ready any data I need a Model...

3. Generate A Model 
	- Product model will have a migration
	- List attributes in migration file
	- Run `rake db:migrate`
	- Seed the SB
		- e.g. `Product.create({name: "Coffee cup", price: 500})`
		- `rake db:seed`

4. Create views for looking at the products
5. Create a form for adding data via the browser
6. Handle create and update actions
7. Provide destroy functionality

---

8. Think about other resources (users)

