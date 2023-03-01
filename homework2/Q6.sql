-- I am using bit.io for this question


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

account,channel,
(select s1.channel_name as ch_name
from
(select first.channel_name 
from (
    select distinct upload_request.channel_name
    from upload_request,account
    where upload_request.upload_date between '2023-01-01' and '2023-01-07' and
    upload_request.owner_user_id=account.owner_user_id and
    account.user_address like '%,US'

    
)as first) as s1,

(select second.channel_name 
from
(
    select distinct upload_request.channel_name
    from upload_request,account
    where upload_request.upload_date between '2023-01-08' and '2023-01-14' and
    upload_request.owner_user_id=account.owner_user_id and
    account.user_address like '%,US'

    
)as second) as s2,


(select third.channel_name 
from
(
    select distinct upload_request.channel_name
    from upload_request,account
    where upload_request.upload_date between '2023-01-15' and '2023-01-21' and
    upload_request.owner_user_id=account.owner_user_id and
    account.user_address like '%,US'

    
)as third) as s3,

(select fourth.channel_name 
from
(
    select distinct upload_request.channel_name
    from upload_request,account
    where upload_request.upload_date between '2023-01-22' and '2023-01-28' and
    upload_request.owner_user_id=account.owner_user_id and
    account.user_address like '%,US'

    
)as fourth) as s4,

(select fifth.channel_name 
from
(
    select distinct upload_request.channel_name
    from upload_request,account
    where upload_request.upload_date between '2023-01-29' and '2023-01-31' and
    upload_request.owner_user_id=account.owner_user_id and
    account.user_address like '%,US'

    
)as fifth) as s5

where
s1.channel_name =s2.channel_name and
s2.channel_name =s3.channel_name and
s3.channel_name =s4.channel_name and
s4.channel_name =s5.channel_name 


) as final_channel

where account.owner_user_id=channel.owner_user_id and channel.channel_name=final_channel.ch_name



