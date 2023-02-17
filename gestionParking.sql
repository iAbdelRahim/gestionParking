/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  17/02/2023 09:59:54                      */
/*==============================================================*/


drop table if exists FACTURE;

drop table if exists PARKING;

drop table if exists TYPEV;

drop table if exists VEHICULE;

/*==============================================================*/
/* Table : FACTURE                                              */
/*==============================================================*/
create table FACTURE
(
   IDF                  int not null,
   IMMATRICULATION      char(256) not null,
   PRIXF                int not null,
   primary key (IDF)
);

/*==============================================================*/
/* Table : PARKING                                              */
/*==============================================================*/
create table PARKING
(
   IDP                  int not null,
   PLACEMOTO            int,
   PLACEPERSONNEL       int,
   PLACECAMION          int,
   primary key (IDP)
);

/*==============================================================*/
/* Table : TYPEV                                                */
/*==============================================================*/
create table TYPEV
(
   IDT                  int not null,
   DENOMINATION         char(256) not null,
   primary key (IDT)
);

/*==============================================================*/
/* Table : VEHICULE                                             */
/*==============================================================*/
create table VEHICULE
(
   IMMATRICULATION      char(256) not null,
   IDT                  int not null,
   IDP                  int not null,
   DUREE                int not null,
   primary key (IMMATRICULATION)
);

alter table FACTURE add constraint FK_RECEVOIR foreign key (IMMATRICULATION)
      references VEHICULE (IMMATRICULATION) on delete restrict on update restrict;

alter table VEHICULE add constraint FK_APPARTENIR foreign key (IDT)
      references TYPEV (IDT) on delete restrict on update restrict;

alter table VEHICULE add constraint FK_OCCUPER foreign key (IDP)
      references PARKING (IDP) on delete restrict on update restrict;

