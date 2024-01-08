
create table `Productinfor` (
 ProductinforId int(11) not null,
 ProductUnit varchar(255)  default null,
 ProductMake varchar(255)  default null,
 ProductType varchar(255)  default null,
 primary key (ProductinforId)    
) engine=InnoDB default charset=utf8mb4;

