select cust.customer_id,cust.tanggal_buka_rek
from
(select mdt.customer_id ,mdt.no_rekening ,to_char(mdt.tanggal_buka_rekening,'dd-mm-yyyy') as tanggal_buka_rek
from public.master_data_tabungan mdt 
join public.detail_status_rekening dsr 
on dsr.id_status =mdt.status_rekening 
where dsr.descripsi_status ='Aktif') cust
join 
(select sst.no_rekening 
from public.saldo_sisa_tabungan sst 
join public.transaksi_simpanan ts 
on ts.id_transaksi =sst.id_transaksi 
where to_char(ts.waktu_transaksi,'dd-mm-yyyy')='09-05-2021' and sst.tipe_transaksi ='Debit') trx
on trx.no_rekening =cust.no_rekening
