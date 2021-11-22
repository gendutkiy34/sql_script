select ts.id_transaksi,sst.no_rekening 
from public.transaksi_simpanan ts
join public.saldo_sisa_tabungan sst 
on sst.id_transaksi =ts.id_transaksi 
where to_char(ts.waktu_transaksi ,'dd-mm-yyyy') = '10-05-2021'
