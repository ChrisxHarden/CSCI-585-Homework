-- I am using bit.io for this question

----please make sure starting with a new database or delete all exsiting tables before running this SQL code
create table account(
    owner_user_id varchar not null unique,
    owner_name varchar,
    email varchar,
    user_address varchar,
    age int default 0,
    is_vid_creator bool default False,

    primary key (owner_user_id)

);


create table channel(
    
    channel_name varchar not null unique,
    owner_user_id varchar not null,
    creation_date date not null,
    total_sub int default 0,
    primary key (channel_name),
    foreign key (owner_user_id) references account on update cascade

);

create table video(
    video_url varchar not null unique,
    video_title varchar not null,
    thumbnail int default 0,
    description varchar,
    duration int not null default 0,
    
    --duration here is measured by how many seconds
    primary key (video_url)

);

create table upload_request(
    owner_user_id varchar not null,
    channel_name varchar not null,
    video_url varchar not null,
    upload_date date not null,
    primary key (owner_user_id,channel_name,video_url),
    foreign key (owner_user_id) references account on update cascade,
    foreign key (channel_name) references channel on update cascade,
    foreign key (video_url) references video on update cascade


);
------finish creating table


insert into account values('escromte', 'Lewis Hamilton', 'qhrh@gvq.com', '4480 W 31,New Mexico,US', 41);
insert into account values('fniixqyp', 'Pierre Zhou', 'ffaj@aue.com', '2440 N 47 New York,US', 20);
insert into account values('ihidynae', 'John Massi', 'zwav@hyx.com', '2819 S 51 Beijing,China', 39);
insert into account values('midfcivf', 'John Zhao', 'tgou@mcm.com', '3955 S 95 New Mexico,US', 12);

-----------finish inserting data into account

insert into channel values('Lewis_channel','escromte','2013-06-07',282);-- owner 1's channel, in us, uploaded 1 video per week last month, qualified
insert into channel values('Champion_here','escromte','2013-06-07',103);--owner 1's channel, in us, didn't uploaded 1 video per week last month, not qualified
insert into channel values('Zhou','fniixqyp','2013-06-07',102);--owner 2's channel, in us,  uploaded 1 video per week last month, qualified
insert into channel values('24','fniixqyp','2013-06-07',7);--owner 2's channel, in us, didn't uploaded 1 video per week last month, not qualified
insert into channel values('BJ','ihidynae','2013-06-07',203);--owner 1's channel, not in us, not qualified
insert into channel values('lazyaf','midfcivf','2013-06-07',53);--owner 4's channel, in us, didn't uploaded 1 video per week last month, not qualified

-----finish inseting data into channel-----------------------------
insert into video values('https://www.youtube.com/oz92r57lv0', 'kcngbqorvbcpumcz', 290, 'djsygpkxkybdevejovooyspndgxjxnmkttmqve', 4022);
insert into video values('https://www.youtube.com/o4m9lfhg1s', 'mkzdiwarierprhtu', 926, 'ovzbzlchxfbbumzgkosbitxvxdyzlxrxmigcvs', 334);
insert into video values('https://www.youtube.com/ury2vbmqa7', 'iloigqauprbkanyo', 368, 'vabiruenvmztmevlzxouemibdsovtywpmpnlgy', 514);
insert into video values('https://www.youtube.com/m0tjb315aq', 'gjfzbborxahzhnrg', 150, 'ahqboskvothtximsdmwssevhihpsrwzqlagjod', 3600);
insert into video values('https://www.youtube.com/a71t3v5j0y', 'sgtungebxsejyvak', 315, 'aztjlxyvmjhcvazhybvtueedxabxfzccaqrigm', 1770);
insert into video values('https://www.youtube.com/vazeyf7stj', 'ytrrzkejatpuwcyw', 20, 'ircukcxtxroindoljchjgektiggbyochuhjubj', 1303);
insert into video values('https://www.youtube.com/92y0d1nxv4', 'bdgtyxpcsqkyotmh', 15, 'fgewdqtbgqbvkgvlsrprstrzjzbtkojeujjzen', 727);
insert into video values('https://www.youtube.com/mf41vy8zco', 'bufredxibnelfucp', 914, 'jbrkpdxdpklfmqegcrnolisklvbozjlcsrzrwb', 2844);
insert into video values('https://www.youtube.com/ztnvq0byg7', 'jezihxoihxzvityf', 782, 'tlrkhebrbxiyeczbtfclwmumgcgqmhfbzrtvbl', 5141);
insert into video values('https://www.youtube.com/e8iwsa47k0', 'pgchxxithgkmafyv', 853, 'lcexlznntrzcgijieqgkloypgrljqwdjoeogaq', 2092);
insert into video values('https://www.youtube.com/4xufh3p8j9', 'pjwpgxvbgnwfjboq', 403, 'hvfwhaficuxtokxkusgqzrwecjzavfwnqkjqag', 4369);
insert into video values('https://www.youtube.com/ibptz3s0f5', 'dwdvbakpdgkjpblh', 90, 'ceeycorfjplmugzecwummkhqztuzwbmvfhcvlk', 1191);
insert into video values('https://www.youtube.com/e6hcfux7oa', 'yxekdczhmuuymvbq', 422, 'sieomadfhfikbngfzjtjwcpzwnsxjtncvmyuct', 626);
insert into video values('https://www.youtube.com/fx9ycot2al', 'zqcoebegvunxdgtq', 326, 'utbplpnavctwsdkafaictbsjvszcwbleexfqvg', 3774);
insert into video values('https://www.youtube.com/cu9hjkqgzv', 'kjiovgxpnkveaacs', 67, 'cioptswppbifnbqjqtfmgfqenbxdlpujrrpufy', 209);
insert into video values('https://www.youtube.com/kq90g5o8il', 'ikehgxmvilvewdlo', 832, 'tmtmhnesysxxbbitmtnywgloyacuxafmajxoxy', 1294);
insert into video values('https://www.youtube.com/1jlidhu9pk', 'cbybocakbdkxylle', 385, 'hztdnivhmhuaembczkthiyyfertdvegbynrbjm', 5048);



---------finish inserting data into video---------------


insert into upload_request values('escromte','Lewis_channel','https://www.youtube.com/oz92r57lv0', '2023-01-04');--1-7
insert into upload_request values('escromte','Lewis_channel','https://www.youtube.com/o4m9lfhg1s', '2023-01-09');--8-14
insert into upload_request values('escromte','Lewis_channel','https://www.youtube.com/ury2vbmqa7', '2023-01-17');--15-21
insert into upload_request values('escromte','Lewis_channel','https://www.youtube.com/m0tjb315aq', '2023-01-25');--22-28
insert into upload_request values('escromte','Lewis_channel','https://www.youtube.com/a71t3v5j0y', '2023-01-31');--28+


insert into upload_request values('escromte','Champion_here','https://www.youtube.com/vazeyf7stj', '2023-01-09');
insert into upload_request values('escromte','Champion_here','https://www.youtube.com/92y0d1nxv4', '2023-01-19');
insert into upload_request values('escromte','Champion_here','https://www.youtube.com/mf41vy8zco', '2023-01-24');
insert into upload_request values('escromte','Champion_here','https://www.youtube.com/ztnvq0byg7', '2023-01-30');

insert into upload_request values('fniixqyp','Zhou','https://www.youtube.com/e8iwsa47k0', '2023-01-04');
insert into upload_request values('fniixqyp','Zhou','https://www.youtube.com/4xufh3p8j9', '2023-01-09');
insert into upload_request values('fniixqyp','Zhou','https://www.youtube.com/ibptz3s0f5', '2023-01-18');
insert into upload_request values('fniixqyp','Zhou','https://www.youtube.com/e6hcfux7oa', '2023-01-24');
insert into upload_request values('fniixqyp','Zhou','https://www.youtube.com/fx9ycot2al', '2023-01-31');

insert into upload_request values('fniixqyp','24','https://www.youtube.com/cu9hjkqgzv','2023-01-04');

insert into upload_request values('ihidynae','BJ','https://www.youtube.com/kq90g5o8il', '2023-01-04');

insert into upload_request values('midfcivf','lazyaf','https://www.youtube.com/1jlidhu9pk', '2023-01-04');


-------------finish inserting data into upload_request--------------

-------------finish data insertion--------------------------------------------






select account.owner_name,channel.channel_name,channel.total_sub
from

account,channel,-- the selection below is going to select those channels which uploaded at least 1 video per week last month and owner is in US
(select s1.channel_name as ch_name
from
(select first.channel_name 
from (
    select distinct upload_request.channel_name
    from upload_request,account
    where upload_request.upload_date between '2023-01-01' and '2023-01-07' and-- make sure the video is uploaded in 1st week
    upload_request.owner_user_id=account.owner_user_id and--join upload_request and account to find whether the uploaded lives in US
    account.user_address like '%,US'

    
)as first) as s1,-- s1 is going to select those channels which uploaded at least 1 video in the first week last month and owner is in US

(select second.channel_name 
from
(
    select distinct upload_request.channel_name
    from upload_request,account
    where upload_request.upload_date between '2023-01-08' and '2023-01-14' and-- make sure the video is uploaded in 2nd week
    upload_request.owner_user_id=account.owner_user_id and--join upload_request and account to find whether the uploaded lives in US
    account.user_address like '%,US'

    
)as second) as s2,-- s2 is going to select those channels which uploaded at least 1 video in the second week last month and owner is in US


(select third.channel_name 
from
(
    select distinct upload_request.channel_name
    from upload_request,account
    where upload_request.upload_date between '2023-01-15' and '2023-01-21' and-- make sure the video is uploaded in 3rd week
    upload_request.owner_user_id=account.owner_user_id and--join upload_request and account to find whether the uploaded lives in US
    account.user_address like '%,US'

    
)as third) as s3,-- s3 is going to select those channels which uploaded at least 1 video in the third week last month and owner is in US

(select fourth.channel_name 
from
(
    select distinct upload_request.channel_name
    from upload_request,account
    where upload_request.upload_date between '2023-01-22' and '2023-01-28' and-- make sure the video is uploaded in 4th week
    upload_request.owner_user_id=account.owner_user_id and--join upload_request and account to find whether the uploaded lives in US
    account.user_address like '%,US'

    
)as fourth) as s4,-- s4 is going to select those channels which uploaded at least 1 video in the fourth week last month and owner is in US

(select fifth.channel_name 
from
(
    select distinct upload_request.channel_name
    from upload_request,account
    where upload_request.upload_date between '2023-01-29' and '2023-01-31' and-- make sure the video is uploaded in 5th week
    upload_request.owner_user_id=account.owner_user_id and--join upload_request and account to find whether the uploaded lives in US
    account.user_address like '%,US'

    
)as fifth) as s5-- s5 is going to select those channels which uploaded at least 1 video in the fifth week last month and owner is in US

where
s1.channel_name =s2.channel_name and-- join s1 and s2

s2.channel_name =s3.channel_name and-- join s2 and s3
s3.channel_name =s4.channel_name and-- join s3 and s4
s4.channel_name =s5.channel_name -- join s4 and s5

----these conditions is aimed to find the channels qualified in 1st week and 
----those in 2nd week and those in 3rd week and those in 4th week and those in 5th week 

----And combine them together to see if any channel is qualified in all these 5 weeks,if such channel exists, those are the channels we need 


) as final_channel----the qualified channel is choosen as final_channel

where account.owner_user_id=channel.owner_user_id and --join account and channel to get account owner's information
channel.channel_name=final_channel.ch_name--join channel and qualified channel



