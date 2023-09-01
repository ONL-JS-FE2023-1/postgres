------Pizza Delivery-----


/*

Ресторани готують піцци
Служби доставки розвозять піцци
Ресторанів багато, ресторан зв'язаний зі службами доставки, які працюють в конкретних районах
Служби доставки можуть працювати одночасно по декількох районах

*/

CREATE TABLE reustrants(
    id SERIAL PRIMARY KEY
)

CREATE TABLE delivery_services(
    id serial PRIMARY KEY
)

CREATE TABLE restaurants_to_deliveries(
    restaurant_id int REFERENCES reustrants(id),
    delivery_id int REFERENCES delivery_services(id),
    PRIMARY KEY(restaurant_id, delivery_id)
)

INSERT INTO restaurants_to_deliveries VALUES
(1, 1, 'pepperoni'),
(1, 1, 'sea'),
(1, 1, '4chease'),
(1, 1, 'hawaii'),
(1, 2, 'pepperoni'),
(1, 2, 'sea'),
(1, 2, 'chief'),
(1, 3, 'pepperoni');


CREATE TABLE pizzas(
    name varchar(200) PRIMARY KEY
);

CREATE TABLE pizzas_to_restaurants(
    pizza_type varchar(300),
    restaurant_id int REFERENCES reustrants(id),
    PRIMARY KEY(pizza_type, restaurant_id) 
);
