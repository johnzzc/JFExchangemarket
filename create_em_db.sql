/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2014/4/19 22:46:45                           */
/*==============================================================*/


drop table if exists em_goods;

drop table if exists em_order;

drop table if exists em_user;

/*==============================================================*/
/* Table: em_goods                                              */
/*==============================================================*/
create table em_goods
(
   goodsid              int not null auto_increment,
   goodsname            char(255) not null,
   price                int,
   description          blob,
   primary key (goodsid)
)
auto_increment = 100;

/*==============================================================*/
/* Table: em_order                                              */
/*==============================================================*/
create table em_order
(
   orderid              int not null auto_increment,
   sellerid             int not null,
   sellgoodsid          int not null,
   buyerid              int,
   exchangegoodsid      int not null,
   status               int,
   lastactiontime       datetime not null,
   primary key (orderid)
)
auto_increment = 100;

/*==============================================================*/
/* Table: em_user                                               */
/*==============================================================*/
create table em_user
(
   userid               int not null auto_increment,
   position             char(255),
   account              char(255),
   name                 char(255),
   emailaddress         char(255),
   mobile               char(255),
   secondphone          char(255),
   editedtime           timestamp,
   primary key (userid)
)
auto_increment = 100;

alter table em_order add constraint FK_Reference_1 foreign key (buyerid)
      references em_user (userid) on delete restrict on update restrict;

alter table em_order add constraint FK_Reference_2 foreign key (sellerid)
      references em_user (userid) on delete restrict on update restrict;

alter table em_order add constraint FK_Reference_3 foreign key (sellgoodsid)
      references em_goods (goodsid) on delete restrict on update restrict;

alter table em_order add constraint FK_Reference_4 foreign key (exchangegoodsid)
      references em_goods (goodsid) on delete restrict on update restrict;

