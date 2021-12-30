use finalcms;

insert into role(roleName,roleDesc) values('admin','Quản trị viên');
insert into role(roleName,roleDesc) values('trainer','Giảng viên');

insert into user(username,dob,email,fullName,password,phone,status)
values('thanhnguyen','1001-01-01','asdsadas','thanhpro','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','0312323',1);
insert into user(username,dob,email,fullName,password,phone,status)
values('thanhnguyen11','1001-01-01','asdsadas','thanhpro1','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','0312323',1);
insert into user(username,dob,email,fullName,password,phone,status)
values('thanhnguyen2222','1001-01-01','asdsadas','thanhpro222','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','0312323',1);
INSERT INTO user_role(username,roleId) VALUES ('thanhnguyen',1);
INSERT INTO user_role(username,roleId) VALUES ('thanhnguyen11',2);
INSERT INTO user_role(username,roleId) VALUES ('thanhnguyen2222',2);