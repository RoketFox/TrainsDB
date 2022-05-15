INSERT INTO carriage_types
(type_name)
VALUES
("Купэ"),
("Плацкарт"),
("Ресторан");


INSERT INTO carriages
(carriage_type_id)
VALUES
(1),
(1),
(1),
(2),
(2),
(2),
(3),
(3),
(3),
(3);

INSERT INTO carriages_in_trains
(train_id, carriage_no, carriage_id)
VALUES
(1, 1, 1),
(1, 2, 1),
(1, 3, 2),
(1, 4, 2),
(1, 5, 3),
(2, 1, 1),
(2, 2, 1),
(2, 3, 2),
(2, 4, 2),
(2, 5, 3);


INSERT INTO client_document_types
(type_name)
VALUES
("Паспорт"),
("Загранпаспорт"),
("Свидетельство о рождении");


INSERT INTO client_documents
(
client_id,
document_number,
family_name,
given_name,
patronymic,
birthdate,
gender_id,
document_type_id,
document_issue_place_id
)
VALUES
(1, 1234535, "Ченцов", "Дмитрий", "Владиславович", "14-03-2005", 1, 1, 1),
(2, 5445643, "Лисов", "Максим", "Дмитриевич", "03-11-2005", 1, 1, 2),
(2, 5445643, "Лисов", "Максим", "Дмитриевич", "03-11-2005", 1, 1, 2),
(3, 0987653, "Никулин", "Иван", "Васильевич", "14-03-2005", 1, 1, 1),
(3, 0987653, "Ченцов", "Дмитрий", "Владиславович", "14-03-2005", 1, 1, 1);


INSERT INTO clients
(username, password, email)
VALUES
("xs1nus", "c001_pa22w0rd", "fun1ham@gmail.com"),
("Roket_Fox", "Fox228Max", "maksim.dmd05@gmail.com"),
("Ioan", "Nikulin567", "IoanN@gmail.com");


INSERT INTO document_issue_place
(org_name, org_code, geo_entry_id)
VALUES
("МВД по Орехово-Борисово Южное", 10, 2),
("МВД по Орехово-Борисово Северное", 20, 2),
("МВД Беларусии", 123, 3);


INSERT INTO genders
(gender_name)
VALUES
('М'),
('Ж'),
('attack helicopter');


INSERT INTO geo_entities
(geo_entity_name)
VALUES
("Европа"),
("Россия"),
("Московская область"),
("Москва"),
("Волгоградская область"),
("Волград"),
("Волжский"),
("Беларусь"),
("Брест"),
("Минск");


INSERT INTO geo_hierarchy
(parent, child)
VALUES
(1, 2),
(1, 8),
(2, 3),
(2, 5),
(3, 4),
(5, 6),
(5, 7),
(8, 9),
(8, 10);


INSERT INTO locomotives_in_trains
(train_id, locomotive_id, main_engine)
VALUES
(1, 1, 1),
(1, 2, 0),
(2, 1, 0);


INSERT INTO locomotive_types
(type_name)
VALUES
('паровоз'),
('электровоз'),
('тепловоз');


INSERT INTO locomotives
(locomotive_type_id)
VALUES
(1),
(1),
(2),
(2),
(3),
(3),
(2),
(2),
(1),
(1);


INSERT INTO platforms
(platform_no, station_id)
VALUES
(1, 1),
(2, 1),
(3, 1),
(1, 2),
(2, 2),
(3, 2),
(1, 3),
(2, 3),
(3, 3),
(1, 4),
(2, 4),
(3, 4);


INSERT INTO routes
(route_name)
VALUES
("Москва-Брест"),
("Москва-Минск"),
("Волгоград-Москва");


INSERT INTO run_plan_timetable
(run_plan_id, sir_entry, arrival, stop_minutes)
VALUES
(1, 2, '12-04-2022', 10),
(2, 1, '13-06-2021', 15),
(1, 3, '13-06-2021', 15),
(3, 4, '14-06-2021', 15),
(4, 5, '15-06-2021', 15),
(5, 6, '15-06-2021', 15);



INSERT INTO run_plans
(route_id, descript)
VALUES
(1, "Москва-СПБ вечер"),
(2, "Москва-Минск утро"),
(3, "Москва-Брест вечер"),
(4, "Волгоград-Москва утро"),
(5, "Волгоград-Московская область вечер");


INSERT INTO run_timetable
(run_id, rpt_entry, arrival)
VALUES
(1, 1, '02-03-2033'),
(1, 2, '14-12-2077'),
(2, 2, '14-12-2077'),
(2, 4, '14-12-2077'),
(3, 3, '14-12-2077');


INSERT INTO runs
(train_id,run_plan_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3);


INSERT INTO stations
(station_name, geo_entity_id)
VALUES
("Октябрьский", 2),
("Павелецкий", 4),
("Волжский", 7),
("Белорусский", 4),
("Лисий", 9),
("Волгоградский", 6);

INSERT INTO stations_in_routes
(order_no, route_id, station_id)
VALUES
(3, 1, 2),
(6, 2, 1),
(4, 1, 3),
(5, 2, 2),
(2, 1, 3);


INSERT INTO tickets
(client_document_id, rpt_from, rpt_to, carriage_type_id, carriage_no, place_no)
VALUES
(1, 1, 2, 2, 777, 1325),
(1, 2, 1, 1, 123, 548),
(2, 2, 1, 2, 777, 1337),
(3, 2, 1, 1, 777, 1336),
(3, 1, 2, 2, 777, 1338),
(2, 2, 1, 1, 125, 432);


INSERT INTO trains
(train_name)
    VALUES
('Ласточка'),
('Скоростной'),
('Служебный');

