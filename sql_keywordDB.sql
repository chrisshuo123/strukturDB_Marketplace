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

/* 1. Semua Iklan Produk (Tokped) */
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
alter table semuaIklanProdukTokopedia rename to semuaIklanProdukTokped;
alter table semuaIklanProdukTokped
    rename column nama to namaProduk;
alter table semuaIklanProdukTokped
    rename column idStatus_fk to idStatusTokped_fk;
alter table semuaIklanProdukTokped
    add column idKelompokIklanTokped_fk int(10) after tanggalInput;
alter table semuaIklanProdukTokped
	add column idTipeIklan_fk int(10) after tanggalInput;
alter table semuaIklanProdukTokped
	add column namaGrup varchar(100) after idTipeIklan_fk;
alter table semuaIklanProdukTokped
	drop column idKelompokIklanTokped_fk;

select * from semuaIklanProdukTokped;

drop table tipeiklan;

/* 2. Iklan Produk Direkomendasi (Tokped) */
create table iklanProdukRekomendTokped (
    idIklanRekomendasi int(10) primary key auto_increment,
    tanggalInput timestamp not null default current_timestamp,
    idTipeIklan_fk int(10),
    namaGrup varchar(100),
    namaProduk varchar(100) not null,
    idStatusTokped_fk int(10),
    pengeluaran bigint(20),
    pendapatan bigint(20),
    totalEfektivitasIklan decimal(10,2),
    efektivitasIklan decimal(10,2),
    performaTampil decimal(10,2),
    tampilTeratas int(10),
    tampil int(10),
    klik int(10),
    persentaseKlik decimal(10,2),
    terjual int(10),
    totTerjual int(10),
    persentaseTerjual decimal(10,2),
    rataRata int(10)
);
describe iklanProdukRekomendTokped;

/* 3. Iklan Produk di Pencarian */
create table iklanProdukdiPencarian (
    idIklanPencarian int(10) primary key auto_increment,
    tanggalInput timestamp not null default current_timestamp,
	idTipeIklan_fk int(10),
    namaGrup varchar(100),
    namaProduk varchar(100) not null,
    idStatusTokped_fk int(10),
    pengeluaran bigint(20),
    pendapatan bigint(20),
    totalEfektivitasIklan decimal(10,2),
    efektivitasIklan decimal(10,2),
    performaTampil decimal(10,2),
    tampilTeratas int(10),
    tampil int(10),
    klik int(10),
    persentaseKlik decimal(10,2),
    terjual int(10),
    totTerjual int(10),
    persentaseTerjual decimal(10,2),
    rataRata int(10)
);
describe iklanProdukDiPencarian;

/* 4. Iklan Toko */
create table iklanTokoTokped (
    idIklanTokoTokped int(10) primary key auto_increment,
    tanggalInput timestamp not null default current_timestamp,
	idTipeIklan_fk int(10),
    namaGrup varchar(100),
    idStatusTokped_fk int(10),
    pengeluaran bigint(20),
    pendapatan bigint(20),
    performaTampil decimal(10,2),
    tampilTeratas int(10),
    tampil int(10),
    klik int(10),
    persentaseKlik decimal(10,2),
    totalTerjual int(10),
    persentaseTerjual decimal(10,2),
    rataRata int(10)
);
describe iklanTokoTokped;

/* 5. Laporan Pencarian */
create table laporanPencarianTokped (
    idLaporanPencarian int(10) primary key auto_increment,
    tanggalInput timestamp not null default current_timestamp,
	idTipeIklan_fk int(10),
    namaGrup varchar(100),
    kataKunci varchar(100),
    pengeluaran bigint(20),
    pendapatan bigint(20),
    totalEfektivitasIklan decimal(10,2),
    efektivitasIklan decimal(10,2),
    tampil int(10),
    klik int(10),
    persentaseKlik decimal(10,2),
    terjual int(10),
    rataRata int(10),
    tampilTeratas int(10)
);
describe laporanPencarianTokped;

/* 6. Kata Kunci */
create table kataKunciTokped (
    idKataKunci int(10) primary key auto_increment,
    tanggalInput timestamp not null default current_timestamp,
	idTipeIklan_fk int(10),
    namaGrup varchar(100),
    idStatusTokped_fk int(10),
    idTipePencarian_fk int(10),
    idTipeKatakunci_fk int(10),
    pengeluaran bigint(20),
    pendapatan bigint(20),
    totalEfektivitasIklan decimal(10,2),
    efektivitasIklan decimal(10,2),
    tampil int(10),
    klik int(10),
    persentaseKlik decimal(10,2),
    terjual int(10),
    totTerjual decimal(10,2),
    rataRata int(10),
    tampilTeratas int(10)
);
describe kataKunciTokped;

create table statusTokped (
    idStatusTokped int(10) primary key,
    tanggalInput timestamp not null default current_timestamp,
    statusTokped varchar(100)
);
describe statusTokped;

/* ================================ */
/* 3.2 - GRUP IKLAN PRODUK (Shopee) */

create table dataKeseluruhanIklanShopee (
    idDataKeseluruhan int(10) primary key auto_increment,
    tanggalInput timestamp not null default current_timestamp,
    /* Yang dari table kelompok */
    namaIklan Varchar(100) not null,
    idStatusShopee_fk int(10),
    idJenisIklan_fk int(10),
    kodeProduk varchar(10),
    tampilanIklan varchar(100),
    idModeBidding_fk int(10), /* Belum diketik create table */
    idPenempatanIklan_fk int(10), /* Belum diketik create table */
    /* --------------- */
    tglMulai DATETIME,
    tglSelesai DATETIME,
    dilihat int(10),
    jumlahKlik int(10),
    persentaseKlik decimal(10,2),
    konversi decimal(10,2),
    konversiLangsung decimal(10,2),
    tingkatKonversi decimal(10,2),
    tingkatKonversiLangsung decimal(10,2),
    biayaPerKonversi int(10),
    biayaPerKonversiLangsung int(10),
    /* Lanjutannya */
    produkTerjual int(10),
    terjualLangsung int(10),
    omsetPenjualan bigint(20),
    penjualanLangsungGMV bigint(20),
    biaya int(10),
    efektivitasIklan decimal(10,2),
    efektivitasLangsung decimal(10,2),
    acos decimal(10,2),
    acosLangsung decimal(10,2),
    jumProdukDilihat int(10),
    jumKlikProduk int(10),
    persentaseKlikProduk decimal(10,2)
);

create table laporanPenempatanKataPencarianIklanShopee (
    idKataPencarianShopee int(10) primary key auto_increment,
    tanggalInput timestamp not null default current_timestamp,
    /* Yang dari table kelompok */
    namaIklan Varchar(100) not null,
    idStatusShopee_fk int(10),
    idJenisIklan_fk int(10),
    kodeProduk varchar(10),
    tampilanIklan varchar(100),
    idModeBidding_fk int(10), /* Belum diketik create table */
    idPenempatanIklan_fk int(10), /* Belum diketik create table */
    /* --------------- */
    kataPencarianPenempatan int(10),
    idTipePencocokan_fk int(10),
    tglMulai DATETIME,
    tglSelesai DATETIME,
    dilihat int(10),
    jumlahKlik int(10),
    persentaseKlik decimal(10,2),
    konversi decimal(10,2),
    konversiLangsung decimal(10,2),
    tingkatKonversi decimal(10,2),
    tingkatKonversiLangsung decimal(10,2),
    biayaPerKonversi int(10),
    biayaPerKonversiLangsung int(10),
    /* Lanjutannya */
    produkTerjual int(10),
    terjualLangsung int(10),
    omsetPenjualan bigint(20),
    penjualanLangsungGMV bigint(20),
    biaya int(10),
    efektivitasIklan decimal(10,2),
    efektivitasLangsung decimal(10,2),
    acos decimal(10,2),
    acosLangsung decimal(10,2),
    jumProdukDilihat int(10),
    jumKlikProduk int(10),
    persentaseKlikProduk decimal(10,2)
);

create table tipePencocokan (
    idTipePencocokan int(10) primary key auto_increment,
    tanggalInput timestamp not null default current_timestamp,
    tipePencocokan Varchar(100)
);

create table statusShopee (
    idStatusShopee int(10) primary key auto_increment,
    tanggalInput timestamp not null default current_timestamp,
    status Varchar(100)
);

create table jenisIklan (
    idJenisIklan int(10) primary key auto_increment,
    tanggalInput timestamp not null default current_timestamp,
    jenisIklan Varchar(100)
);