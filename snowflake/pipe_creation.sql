create or replace database projekt

create or replace storage integration s3_init_1
    type = external_stage
    storage_provider = S3
    enabled = true
    storage_aws_role_arn = 'arn:aws:iam::927463228983:role/s3-to-snowflakeconn-s3_init_1'   
    storage_allowed_locations = ('s3://spotify-etl-projekt-1v/transformed_data/')
    comment = 'Connection to s3';

desc storage integration s3_init_1;

create or replace schema external_stage_1;

create or replace stage external_stage_1.transformed_data
url = 's3://spotify-etl-projekt-1v/transformed_data/'
storage_integration = s3_init_1
file_format = projekt.file_formats.csv_fileformat;

list @transformed_data;

create or replace stage projekt.external_stage_1.album_folder
url = 's3://spotify-etl-projekt-1v/transformed_data/album_data/'
storage_integration = s3_init_1
file_format = projekt.file_formats.csv_fileformat;

create or replace stage projekt.external_stage_1.artists_folder
url = 's3://spotify-etl-projekt-1v/transformed_data/artist_data/'
storage_integration = s3_init_1
file_format = projekt.file_formats.csv_fileformat;

create or replace stage projekt.external_stage_1.songs_folder
url= 's3://spotify-etl-projekt-1v/transformed_data/song_data/'
storage_integration = s3_init_1
file_format = projekt.file_formats.csv_fileformat;

list @album_folder;
list @artists_folder;
list @songs_folder;


// Creating the snowpipe
create or replace schema projekt.pipes;

create or replace table projekt.public.albums_test (
    album_id varchar(50) primary key,
    album_name varchar(50),
    album_release_date date,
    album_total_tracks int,
    album_url varchar(300)
);

create or replace pipe projekt.pipes.albums_pipe
auto_ingest = true
as 
copy into projekt.public.albums_test
from @projekt.external_stage_1.album_folder;

desc pipe projekt.pipes.albums_pipe;

create or replace table projekt.public.artists_test (
    artist_id varchar(50) primary key,
    artist_name varchar(30),
    external_url varchar(1000)
);

create or replace pipe projekt.pipes.artists_pipe
auto_ingest = true
as
copy into projekt.public.artists_test
from @projekt.external_stage_1.artists_folder;

create or replace table projekt.public.songs_test (
    song_id varchar(100) primary key,
    song_name varchar(100),
    song_duration int,
    song_url varchar(1000),
    song_popularity int,
    song_added timestamp,
    album_id varchar(50),
    artist_id varchar(100)
);

create or replace pipe projekt.public.songs_pipe 
auto_ingest = true
as 
copy into projekt.public.songs_test
from @projekt.external_stage_1.songs_folder;

select * from projekt.public.albums_test;
select * from projekt.public.artists_test;
select * from projekt.public.songs_test;

show pipes;