CREATE TABLE carriage_types
            (
            carriage_type_id INTEGER PRIMARY KEY NOT NULL,
            type_name TEXT NOT NULL
            );

CREATE TABLE carriages
            (
            carriage_id INTEGER PRIMARY KEY NOT NULL,
            carriage_type_id INTEGER NOT NULL
            );

CREATE TABLE carriages_in_trains
            (
            cit_entry INTEGER PRIMARY KEY NOT NULL,
            train_id INTEGER NOT NULL,
            carriage_no INTEGER NOT NULL,
            carriage_id INTEGER NOT NULL
            );

CREATE TABLE client_document_types
            (
            document_type_id INTEGER PRIMARY KEY NOT NULL,
            type_name TEXT NOT NULL
            );

CREATE TABLE client_documents
            (
            client_document_id INTEGER PRIMARY KEY NOT NULL,
            client_id INTEGER NOT NULL,
            document_number TEXT NOT NULL,
            family_name TEXT NOT NULL,
            given_name TEXT NOT NULL,
            patronymic TEXT NOT NULL,
            birthdate DATE NOT NULL,
            gender_id INTEGER NOT NULL,
            document_type_id INTEGER NOT NULL,
            document_issue_place_id INTEGER NOT NULL
            );

CREATE TABLE clients
            (
            client_id INTEGER PRIMARY KEY NOT NULL,
            username TEXT NOT NULL,
            password TEXT NOT NULL,
            email TEXT NOT NULL
            );

CREATE TABLE document_issue_place
            (
            document_issue_place_id INTEGER PRIMARY KEY NOT NULL,
            org_name TEXT NOT NULL,
            org_code TEXT NOT NULL,
            geo_entry_id INTEGER NOT NULL
            );

CREATE TABLE genders
            (
            gender_id INTEGER PRIMARY KEY NOT NULL,
            gender_name TEXT NOT NULL
            );

CREATE TABLE geo_entities
            (
            geo_entity_id INTEGER PRIMARY KEY NOT NULL,
            geo_entity_name TEXT NOT NULL
            );

CREATE TABLE geo_hierarchy
            (
            geo_hierarchy_entry INTEGER PRIMARY KEY NOT NULL,
            parent INTEGER NOT NULL,
            child INTEGER NOT NULL
            );

CREATE TABLE locomotives_in_trains
            (
            lit_entry INTEGER PRIMARY KEY NOT NULL,
            train_id INTEGER NOT NULL,
            locomotive_id INTEGER NOT NULL,
            main_engine BIT NOT NULL
            );

CREATE TABLE locomotive_types
            (
            locomotive_type_id INTEGER PRIMARY KEY NOT NULL,
            type_name TEXT NOT NULL
            );

CREATE TABLE locomotives
            (
            locomotive_id INTEGER PRIMARY KEY NOT NULL,
            locomotive_type_id INTEGER NOT NULL
            );

CREATE TABLE platforms
            (
            platform_id INTEGER PRIMARY KEY NOT NULL,
            platform_no TEXT NOT NULL,
            station_id INTEGER NOT NULL
            );


CREATE TABLE routes
            (
            route_id INTEGER PRIMARY KEY NOT NULL,
            route_name TEXT NOT NULL
            );

CREATE TABLE run_plan_timetable
            (
            rpt_entry INTEGER PRIMARY KEY NOT NULL,
            run_plan_id INTEGER NOT NULL,
            sir_entry INTEGER NOT NULL,
            arrival DATE NOT NULL,
            stop_minutes INTEGER NOT NULL
            );

CREATE TABLE run_plans
            (
            run_plan_id INTEGER PRIMARY KEY NOT NULL,
            route_id INTEGER NOT NULL,
            descript TEXT NOT NULL
            );

CREATE TABLE run_timetable
            (
            run_timetable_id INTEGER PRIMARY KEY NOT NULL,
            run_id INTEGER NOT NULL,
            rpt_entry INTEGER NOT NULL,
            arrival DATE NOT NULL
            );

CREATE TABLE runs
            (
            run_id INTEGER PRIMARY KEY NOT NULL,
            train_id INTEGER NOT NULL,
            run_plan_id INTEGER NOT NULL
            );

CREATE TABLE stations
            (
            station_id INTEGER PRIMARY KEY NOT NULL,
            station_name TEXT NOT NULL,
            geo_entity_id INTEGER NOT NULL
            );

CREATE TABLE stations_in_routes
            (
            sir_entry INTEGER PRIMARY KEY NOT NULL,
            order_no INTEGER NOT NULL,
            route_id INTEGER NOT NULL,
            station_id INTEGER NOT NULL
            );

CREATE TABLE tickets
            (
            ticket_id INTEGER PRIMARY KEY NOT NULL,
            client_document_id INTEGER NOT NULL,
            rpt_from INTEGER NOT NULL,
            rpt_to INTEGER NOT NULL,
            carriage_type_id INTEGER NOT NULL,
            carriage_no INTEGER NOT NULL,
            place_no INTEGER NOT NULL
            );

CREATE TABLE trains
            (
            train_id INTEGER PRIMARY KEY NOT NULL,
            train_name TEXT NOT NULL
            );
