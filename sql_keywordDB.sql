use keyword_marketplace_db;

/* 1 - GRUP PROFILE */

create table profile (
	idProfile int(10) primary key auto_increment,
    tanggalInput timestamp not null default current_timestamp,
    jenisMP varchar(10)
);

create table namaTokoMarketplace (
	idNamaToko int(10) primary key auto_increment,
    idToko int(10)
);
alter table namaTokoMarketplace
	add column tanggalInput timestamp not null default current_timestamp after idNamaToko;
    
select * from namaTokoMarketplace;

/* 2 - GRUP LAPORAN */

create table laporan (
	idLaporan int(10) primary key auto_increment,
    waktuLaporanDibuat DATETIME not null
);
alter table laporan
	add column tanggalInput timestamp not null default current_timestamp after idLaporan;
    
create table periode (
	idPeriode int(10) primary key,
    periode varchar(100)
);
alter table periode
	add column tanggalInput timestamp not null default current_timestamp after idPeriode;

/* 3.1 - GRUP IKLAN PRODUK (Tokopedia) */
create table kelompokIklanTokped (
	idKelompokIklanTokped int(10) primary key auto_increment,
    tanggalInput timestamp not null default current_timestamp,
    idTipeIklan_fk int(10),
    namaGrup longtext
);
alter table kelompokIklanTokped
	modify column namaGrup varchar(100);
    
describe kelompokIklanTokped;

create table tipeIklan (
	idTipeIklan int(10) primary key,
    tipeIklan varchar(100)
);
alter table tipeIklan
	add column tanggalInput timestamp not null default current_timestamp after idTipeIklan;

create table iklanProdukTokped (
	idIklanProdukTokped int(10) primary key auto_increment,
    tanggalInput timestamp not null default current_timestamp,
    nama varchar(100),
    idStatus_fk int(10),
    pengeluaran int(10),
    pendapatan int(10),
    totalEfektivitasIklan int(10),
    efektivitasIklan int(10),
    performaTampil decimal(10,2),
    tampilTeratas int(10),
    tampil int(10),
    klik int(10),
    persentaseKlik decimal(10,2),
    terjual int(10),
    totalTerjual int(10),
    persentaseTerjual decimal(10,2),
    rataRata int(10)
);
describe iklanProdukTokped;

/* 3.2 - GRUP IKLAN PRODUK (Shopee) */
create table kelompokIklanShopee (

);
