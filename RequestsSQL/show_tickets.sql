SELECT 
tickets.ticket_id, username || " (" || family_name || 
' ' || given_name || ' ' || patronymic || ', ' || 
client_document_types.type_name || ' #' || document_number ||
')', rpt_f.station_name ||' (' || rpt_f.geo_entity_name || 
') на маршруте ' ||  rpt_f.route_name || ', прибытие в ' || 
rpt_f.arrival || ' в соответствии с ' || rpt_f.descr,

rpt_t.station_name ||' (' || rpt_t.geo_entity_name || 
') на маршруте ' ||  rpt_t.route_name || ', прибытие в ' || 
rpt_t.arrival || ' в соответствии с ' || rpt_t.descr,

carriage_types.type_name, place_no

FROM tickets
JOIN client_documents ON client_documents.client_document_id = tickets.client_document_id
JOIN clients ON client_documents.client_id = clients.client_id
JOIN client_document_types on client_document_types.document_type_id = client_documents.document_type_id
JOIN (
    SELECT
    rpt_entry, station_name, geo_entity_name, 
    route_name, arrival, run_plans.descript as 'descr'
    FROM run_plan_timetable
    JOIN stations_in_routes on stations_in_routes.sir_entry = run_plan_timetable.sir_entry
    JOIN stations on stations.station_id = stations_in_routes.station_id
    JOIN geo_entities on stations.geo_entity_id = geo_entities.geo_entity_id
    JOIN run_plans on run_plans.run_plan_id = run_plan_timetable.run_plan_id
    JOIN routes on routes.route_id = run_plans.route_id
) rpt_f ON rpt_f.rpt_entry = tickets.rpt_from
JOIN (
    SELECT
    rpt_entry, station_name, geo_entity_name, 
    route_name, arrival, run_plans.descript as 'descr'
    FROM run_plan_timetable
    JOIN stations_in_routes on stations_in_routes.sir_entry = run_plan_timetable.sir_entry
    JOIN stations on stations.station_id = stations_in_routes.station_id
    JOIN geo_entities on stations.geo_entity_id = geo_entities.geo_entity_id
    JOIN run_plans on run_plans.run_plan_id = run_plan_timetable.run_plan_id
    JOIN routes on routes.route_id = run_plans.route_id
) rpt_t ON rpt_t.rpt_entry = tickets.rpt_to
JOIN carriage_types ON carriage_types.carriage_type_id = tickets.carriage_type_id
