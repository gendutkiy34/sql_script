CREATE TABLE public.detail_status_rekening (
	id_status numeric(1) NOT NULL,
	descripsi_status bpchar(20) NULL,
	CONSTRAINT detail_status_rekening_pk PRIMARY KEY (id_status)
);

CREATE TABLE public.lokasi_unit (
	id_unit int4 NOT NULL,
	nama_unit bpchar(20) NULL,
	nama_cabang bpchar(30) NULL,
	kantor_wilayah bpchar(20) NULL,
	CONSTRAINT lokasi_unit_pk PRIMARY KEY (id_unit)
);

CREATE TABLE public.customers (
	customer_id int4 NOT NULL,
	nama_customer bpchar(50) NULL,
	tanggal_lahir date NULL,
	provinsi_alamat bpchar(30) NULL,
	jenis_kelamin bpchar(1) NULL,
	status_nikah bpchar(12) NULL,
	gaji int4 NULL,
	CONSTRAINT customers_pk PRIMARY KEY (customer_id)
);

CREATE TABLE public.master_data_pinjaman (
	no_rekening_pinjaman int4 NOT NULL,
	tanggal_buka_pinjaman timestamp NULL,
	tanggal_berakhir_pinjaman timestamp NULL,
	customer_id int4 NULL,
	CONSTRAINT master_data_pinjaman_pk PRIMARY KEY (no_rekening_pinjaman)
);

-- public.master_data_pinjaman foreign keys
ALTER TABLE public.master_data_pinjaman ADD CONSTRAINT master_data_pinjaman_fk FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);

CREATE TABLE public.master_data_tabungan (
	no_rekening int4 NOT NULL,
	jenis_rekening bpchar(20) NULL,
	tanggal_buka_rekening timestamp NULL,
	status_rekening numeric(1) NULL,
	customer_id int4 NULL,
	lokasi_pembuatan_rekening int4 NULL,
	CONSTRAINT master_data_tabungan_pk PRIMARY KEY (no_rekening)
);

-- public.master_data_tabungan foreign keys

ALTER TABLE public.master_data_tabungan ADD CONSTRAINT master_data_tabungan_fk FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);
ALTER TABLE public.master_data_tabungan ADD CONSTRAINT master_data_tabungan_fk_1 FOREIGN KEY (status_rekening) REFERENCES public.detail_status_rekening(id_status);
ALTER TABLE public.master_data_tabungan ADD CONSTRAINT master_data_tabungan_fk_2 FOREIGN KEY (lokasi_pembuatan_rekening) REFERENCES public.lokasi_unit(id_unit);

CREATE TABLE public.transaksi_simpanan (
	id_transaksi int4 NOT NULL,
	jumlah_transaksi numeric(19, 2) NULL,
	waktu_transaksi timestamp NULL,
	CONSTRAINT transaksi_simpanan_pk PRIMARY KEY (id_transaksi)
);

CREATE TABLE public.saldo_sisa_tabungan (
	no_rekening int4 NOT NULL,
	id_transaksi int4 NOT NULL,
	tipe_transaksi bpchar(10) NULL,
	sisa_saldo numeric(19, 2) NULL,
	CONSTRAINT saldo_sisa_tabungan_pk PRIMARY KEY (no_rekening, id_transaksi)
);


-- public.saldo_sisa_tabungan foreign keys

ALTER TABLE public.saldo_sisa_tabungan ADD CONSTRAINT saldo_sisa_tabungan_fk FOREIGN KEY (id_transaksi) REFERENCES public.transaksi_simpanan(id_transaksi);