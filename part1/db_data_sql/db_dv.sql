drop database transit;

create database transit;
use transit;

drop table trips;

create table trips(
route_id varchar(255),
service_id varchar(255),
trip_id varchar(255),
trip_headsign varchar(255),
direction_id varchar(255),
block_id varchar(255),
shape_id varchar(255)
);

drop table shapes;

create table shapes(
shape_id varchar(255),
shape_pt_lat varchar(255),  -- - 
shape_pt_lon varchar(255),
shape_pt_sequence varchar(255),
shape_dist_traveled varchar(255)
);

drop table stop_times;

create table stop_times(
trip_id varchar(255),
arrival_time varchar(255),
departure_time varchar(255),
stop_id varchar(255),
stop_sequence varchar(255),
stop_headsign varchar(255),
pickup_type varchar(255),
drop_off_type varchar(255)
);

load data local infile '/Users/chenyuwei/Desktop/5\ Data\ Visualization/google_transit/shapes.txt ' into table shapes
fields terminated by ','
ignore 1 lines;

load data local infile '/Users/chenyuwei/Desktop/5\ Data\ Visualization/google_transit/trips.txt ' into table trips
fields terminated by ','
ignore 1 lines;

load data local infile '/Users/chenyuwei/Desktop/5\ Data\ Visualization/google_transit/stop_times.txt ' into table stop_times
fields terminated by ','
ignore 1 lines;

drop view shape_view;
create view shape_view as (
select shape_id, max(cast(shape_dist_traveled as signed)) as shape_len -- 677
from shapes
group by shape_id);


drop view stop_times_view;
-- select trip_id, 
create view stop_times_view as (
SELECT trip_id, minute(timediff(max(time(arrival_time)), min(time(arrival_time)))) as period
from stop_times
group by trip_id);


drop view temp1;
create view temp1 as(


select shape_id, min(60/period) as trips_per_hour -- min(trips.trip_id), shape_id, min(60/period)  -- 677
from stop_times_view, trips
where stop_times_view.trip_id = trips.trip_id
group by shape_id

);

-- ----------------------- I am divider ---------------------------------



select shape_len   -- works!
from shape_view
where shape_id = '100N';

select *  -- Not works !
from  temp1
where shape_id = '100N';


select shape_id
from shape_view


select shape_id
from temp1
where shape_id = '100N'

select -- temp1.shape_id, shape_len, trips_per_hour -- count(shape_id)  -- 677
from temp1 join shape_view on temp1.shape_id
-- where temp1.shape_id = shape_view.shape_id;











select count(*) -- shape_id, min(60/period) as "times per hour"
from stop_times_view,trips
where stop_times_view.trip_id = trips.trip_id
group by shape_id;



DROP VIEW shape_times;

create view shape_times as (
select trips.shape_id,shape_pt_lat,shape_pt_lon,shape_pt_sequence,shape_dist_traveled, 60/period as times-- distinct trips.shape_id, 60/period as times
from trips,stop_times_view
where trips.trip_id = stop_times_view.trip_id);  -- 5498

select count(*) from shape_times;


select shape_id
from shape_times
group by shape_id
having count(shape_id)>1;

select * 
from shape_times
where shape_id = '1 YELLOW ALT 25'


select shapes.shape_id,hape_pt_lat,shape_pt_lon,shape_pt_sequence,shape_dist_traveled,times
from shapes, shape_times
where shapes.shape_id = shape_times.shape_id;











select *
from shape_view, 




select *
from stop_times_view
where period < 60;







select trips.shape_id, shape_len
from trips,shape_view
where trips.shape_id = shape_view.shape_id;

select *
from shapes
where shape_id = 'TEAL 23'












-- Wrong ---- 
-- select count(*)
-- from trips inner join stop_times_view on trips.trip_id;



alter table trips add length numeric;

update trips 
set trips.length = (select shape_view.shape_len
from shape_view where trips.shape_id = shape_view.shape_id);



select shape_id
from trips
where exists (select shape_id, shape_len from shape_view )




select *
from shape_view
group by shape_id
having count(*) > 1;

select shape_id, count(shape_id)
from trips
group by shape_id
having count(*) > 1;


select trips





-- -------------------

select  trips.shape_id, shape_len  -- 24700
from trips join shape_view on trips.shape_id;

select distinct shape_id from trips;


select count(*) from shape_view;  -- 677 distinct shape_id



where trips.shape_id = shape_view.shape_id; 

select distinct shape_id
from shapes
where not exists (select distinct shape_id from trips);

select * from shapes where shape_id = 'TEAL 26';
select * from trips where shape_id = 'TEAL 26'

select count(*) from shape_view;   -- 677

select min(shape_id) from trips;
select * from trips where shape_id = (select min(shape_id) from trips);

SELECT * from trips where shape_id in (select  shape_id from shapes);



-- select shape_id
-- from shape_view
-- group by shape_id
-- having count(shape_id)>1;


select *
from trips
where shape_id = '1 YELLOW ALT 25'



select trip_id
from trips
group by trip_id
having count(trip_id) > 1;


select shape_len from shape_view where shape_id = '1 YELLOW ALT 25'



-- select count(*) from trips;
select trip_id from stop_times_view;


select shape_id, max(cast(shape_dist_traveled as signed)) as shape_len -- 677
from shapes
group by shape_id;

select s1.shape_id
from shape_view s1, shape_view s2
where s1.shape_len < s2.shape_len and s1.shape_id = s2.shape_id;

select *
from shape_view
where shape_id = '100 LATE 3';

select *
from trips
where shape_id not in (select shape_id from shapes)


select count(distinct shape_id) 
from shapes
where shape_id not in (

select count(distinct shape_id)
from trips);