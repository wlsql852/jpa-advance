create table users
(
    id   bigint not null auto_increment,
    name varchar(255),
    primary key (id)
);

create table food
(
    id    bigint    not null auto_increment,
    name  varchar(255),
    price float(53) not null,
    primary key (id)
);

create table orders
(
    id         bigint not null auto_increment,
    user_id    bigint,
    food_id    bigint,
    order_date date,
    primary key (id)
);

alter table orders
    add constraint orders_user_fk
        foreign key (user_id)
            references users (id);

alter table orders
    add constraint orders_food_fk
        foreign key (food_id)
            references food (id);

INSERT INTO users (name) VALUES ('Robbie');
INSERT INTO users (name) VALUES ('Robbert');

INSERT INTO food (name, price) VALUES ('후라이드 치킨', 15000);
INSERT INTO food (name, price) VALUES ('양념 치킨', 20000);
INSERT INTO food (name, price) VALUES ('고구마 피자', 30000);
INSERT INTO food (name, price) VALUES ('아보카도 피자', 50000);

INSERT INTO orders (user_id, food_id, order_date) VALUES (1, 1, SYSDATE());
INSERT INTO orders (user_id, food_id, order_date) VALUES (2, 1, SYSDATE());
INSERT INTO orders (user_id, food_id, order_date) VALUES (2, 2, SYSDATE());
INSERT INTO orders (user_id, food_id, order_date) VALUES (1, 4, SYSDATE());
INSERT INTO orders (user_id, food_id, order_date) VALUES (2, 3, SYSDATE());