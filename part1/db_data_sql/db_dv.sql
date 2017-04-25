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


create table stops(
stop_id varchar(255),
stop_code varchar(255),
stop_name varchar(255),
stop_desc varchar(255),
stop_lat varchar(255),
stop_lon varchar(255),
zone_id varchar(255),
stop_url varchar(255),
location_type varchar(255),
parent_station varchar(255)
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

load data local infile '/Users/chenyuwei/Desktop/5\ Data\ Visualization/google_transit/stops.txt ' into table stops
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
SELECT trip_id, TIME_TO_SEC(timediff(max(time(arrival_time)), min(time(arrival_time))))/60 as period
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
use transit;
select * from stop_times_view;

-- -----------

drop view temp_1;
create view temp_1 as(
select shape_id, min(trip_id) as trip_id
from trips
group by shape_id);

drop view shape_period;
create view shape_period as(
select temp_1.shape_id,period
from temp_1,stop_times_view
where temp_1.trip_id = stop_times_view.trip_id);

-- select count(*) from stop_times_view;
select * from temp_1;
select period from shape_period;
select * from shape_period;
select * from shape_view;
select * from stop_times_view;
select shape_id from trips where trip_id = '[@15.0.63189138@][1][1338404910860]/0__Y1UIMF'  -- period = 70   shape_id = 100N



select * from shape_view where shape_id = '100N';

-- -----------!!!!!!!!!!!!!!!!!!!!!!!!



select * from temp_1;



select count(*) -- shape_id, min(60/period) as "times per hour"
from stop_times_view,trips
where stop_times_view.trip_id = trips.trip_id
group by shape_id;



DROP VIEW shape_times;

create view shape_times as (
select trips.shape_id,shape_pt_lat,shape_pt_lon,shape_pt_sequence,shape_dist_traveled, 60/period as times-- distinct trips.shape_id, 60/period as times
from trips,stop_times_view
where trips.trip_id = stop_times_view.trip_id);  

select count(*) from shape_times;

--  --------------- I am divider --------------------- -------



select trip_id, count(trip_id) from stop_times group by trip_id having count(trip_id) = 7;
-- '[@2.0.86175868@][1458585713139]/19__O4_MFF'  7 stops
 
select trip_id, shape_id from trips where trip_id ='[@2.0.86175868@][1458585713139]/19__O4_MF';
-- shape_id= ‘[@2.0.86175868@]19’


-- ahah 就选你这个shape啦
-- 这个trip所经过的所有的stop
select stop_id, stop_sequence from stop_times where trip_id = '[@2.0.86175868@][1458585713139]/19__O4_MF'; -- 7

-- 这些stop的地理位置
drop view pass_stop_view;

create view pass_stop_view as (
select stop_id, stop_lat, stop_lon from stops 
where stop_id  in 
(select stop_id from stop_times where trip_id = '[@2.0.86175868@][1458585713139]/19__O4_MF'));  -- 7

-- 这个trip所经过的地理位置
select shape_id, shape_pt_lat, shape_pt_lon from shapes where shape_id = '[@2.0.86175868@]19';

drop view diff_stop_dist;
create view diff_stop_dist as (
select shapes.shape_id, stop_id, cast(shape_dist_traveled as signed) as distance, shape_pt_sequence
from shapes, pass_stop_view 
where shape_id = '[@2.0.86175868@]19' 
	and shapes.shape_pt_lat = pass_stop_view.stop_lat 
    and shapes.shape_pt_lon = pass_stop_view.stop_lon
    );


select stop_id, from diff_stop_dist;    

-- timediff(max(time(arrival_time)), min(time(arrival_time)))
drop view temp_diff_time_view;
create view temp_diff_time_view as(
select cast(stop_sequence as signed) as stop_sequence, stop_id, time(arrival_time) as starttime  -- stop_id, arrival_time-- trip_id, minute(timediff(time(arrival_time) - min(time(arrival_time))))
from stop_times where trip_id = '[@2.0.86175868@][1458585713139]/19__O4_MF' and stop_id in (
select stop_id
from shapes, pass_stop_view 
where shape_id = '[@2.0.86175868@]19' 
	and shapes.shape_pt_lat = pass_stop_view.stop_lat 
    and shapes.shape_pt_lon = pass_stop_view.stop_lon
    )
);



drop view distance_temp;
create view distance_temp as(
select stop_id, cast(shape_dist_traveled as signed) as distance
from shapes, pass_stop_view 
where shape_id = '[@2.0.86175868@]19' 
	and shapes.shape_pt_lat = pass_stop_view.stop_lat 
    and shapes.shape_pt_lon = pass_stop_view.stop_lon
    );
    

-- select * from distance_temp;

drop table tb_stop_distance;
create table tb_stop_distance (
seq int,
stop_id varchar(255),
distance int
);


-- insert into tb_stop_distance values(1,'BTSLR')
-- select * from temp_diff_time_view; 
create view ori_distance as(
select stop_sequence, temp_diff_time_view.stop_id,distance 
from distance_temp, temp_diff_time_view
where temp_diff_time_view.stop_id = distance_temp.stop_id
);

-- select * from ori_distance;

create view diff_stop_distance as (

select d2.stop_sequence as seq2,
		d2.stop_id as stop_id,
        d2.distance - d1.distance as diff_distance
from ori_distance d1, ori_distance d2
where d1.stop_sequence + 1 = d2.stop_sequence
order by seq2


);





create view diff_stop_times as (
select  -- t1.stop_sequence as seq1, 
		t2.stop_sequence as seq2,
        -- t1.starttime,
	    -- t2.starttime,
        -- t1.stop_id as stop_id1, 
        t2.stop_id as stop_id2, 
        time_to_sec(timediff(t2.starttime, t1.starttime))/60 as difference
        
from temp_diff_time_view as t1, temp_diff_time_view as t2
where t1.stop_sequence + 1 = t2.stop_sequence
order by seq2
);



select * from diff_stop_times;
select * from diff_stop_distance;


select cast(stop_sequence as signed) as stop_sequence, stop_id  -- stop_id, arrival_time-- trip_id, minute(timediff(time(arrival_time) - min(time(arrival_time))))
from stop_times where trip_id = '[@2.0.86175868@][1458585713139]/19__O4_MF' and stop_id in (
select stop_id
from shapes, pass_stop_view 
where shape_id = '[@2.0.86175868@]19' 
	and shapes.shape_pt_lat = pass_stop_view.stop_lat 
    and shapes.shape_pt_lon = pass_stop_view.stop_lon
    )








-- time slot of each stops
drop view diff_stop_time;
create view diff_stop_time as (
select  -- t1.stop_sequence as seq1, 
		t2.stop_sequence as seq2,
        -- t1.starttime,
	    -- t2.starttime,
        -- t1.stop_id as stop_id1, 
        t2.stop_id as stop_id2, 
        time_to_sec(timediff(t2.starttime, t1.starttime))/60 as difference
        
from temp_diff_time_view as t1, temp_diff_time_view as t2
where t1.stop_sequence + 1 = t2.stop_sequence
order by seq2
);


select * from temp_diff_time_view;



-- select * from diff_stop_time;

-- speed for each stop slot
drop view speed_in_stop;
create view speed_in_stop as(
select diff_stop_time.stop_id2 as stop_id, cast(shape_pt_sequence as signed) as shape_seq, distance/difference as miles_per_minute-- ,distance, difference as time_slot
from diff_stop_time, diff_stop_dist
where diff_stop_dist.stop_id = diff_stop_time.stop_id2
);


-- select miles_per_minute from speed_in_stop;


create table speed_area_color(
stop_seq int,
stop_id varchar(255),
diff_time float,
diff_dist int
);


load data local infile '/Users/chenyuwei/Desktop/5\ Data\ Visualization/google_transit/speed_area_color.csv' into table speed_area_color
fields terminated by ','
ignore 1 lines;


alter table speed_area_color add color varchar(255);

select stop_seq,stop_id,diff_time,diff_dist, diff_dist/diff_time as speed
from speed_area_color;

alter table speed_area_color add speed float;

update speed_area_color set speed = diff_dist/diff_time;

update speed_area_color set color = '#EDF7B4' where diff_dist/diff_time <= 300;
update speed_area_color set color = '#3180B6' where diff_dist/diff_time > 300 and diff_dist/diff_time < 600;
update speed_area_color set color = '#82CCBB' where diff_dist/diff_time >= 600;


select * from speed_area_color;


-- a specific table for this shape
create table spec_shape as (
select * 
from shapes
where shape_id = '[@2.0.86175868@]19' 
);

alter table spec_shape add area int;  -- which area it belongs to
alter table spec_shape add color varchar(255);  -- for color show
alter table spec_shape drop color;


--  set area code
update spec_shape set area = 1 where cast(shape_pt_sequence as signed) <= 110;

update spec_shape set area = 2 where cast(shape_pt_sequence as signed) > 110 and cast(shape_pt_sequence as signed) <= 191;

update spec_shape set area = 3 where cast(shape_pt_sequence as signed) > 191 and cast(shape_pt_sequence as signed) <= 214;

update spec_shape set area = 4 where cast(shape_pt_sequence as signed) > 214 and cast(shape_pt_sequence as signed) <= 340;

update spec_shape set area = 5 where cast(shape_pt_sequence as signed) > 340 and cast(shape_pt_sequence as signed) <= 399;

update spec_shape set area = 6 where cast(shape_pt_sequence as signed) > 399 and cast(shape_pt_sequence as signed) <= 608;



-- set color for stop
--  #6F3662 #FF7182 #FFAE5D #F8F8F2 #F8DEBD #9F6164
-- update spec_shape set color = "#6F3662" where area = 1;
-- update spec_shape set color = "#FF7182" where area = 2;
-- update spec_shape set color = "#FFAE5D" where area = 3;
-- update spec_shape set color = "#F8F8F2" where area = 4;
-- update spec_shape set color = "#F8DEBD" where area = 5;
-- update spec_shape set color = "#9F6164" where area = 6;


select * from stop_times_view where trip_id = '[@2.0.86175868@][1458585713139]/19__O4_MF'; -- 3
select * from shape_view where shape_id = '[@2.0.86175868@]19'; -- 1699

select * from stop_times where trip_id = '[@2.0.86175868@][1458585713139]/19__O4_MF';


select * from speed_in_stop;
-- select * from stop_times;
select * from spec_shape;


select route_id from trips where trip_id = '[@2.0.86175868@][1458585713139]/19__O4_MF';


select min(shape_pt_lat),max(shape_pt_lat),min(shape_pt_lon),max(shape_pt_lon) 
from shapes where shape_id = '[@2.0.86175868@]19';
