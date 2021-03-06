SELECT stations_in_routes.order_no||"", run_plans.descript,
"На " || routes.route_name || ": " || stations.station_name
|| "(" || geo_entities.geo_entity_name || ") (" || arrival || ")", stop_minutes
FROM run_plan_timetable 
JOIN run_plans ON run_plan_timetable.run_plan_id = run_plans.run_plan_id
JOIN stations_in_routes ON run_plan_timetable.sir_entry = stations_in_routes.sir_entry
JOIN stations ON stations.station_id = stations_in_routes.station_id
JOIN geo_entities ON stations.geo_entity_id = geo_entities.geo_entity_id
JOIN routes ON routes.route_id = stations_in_routes.route_id;