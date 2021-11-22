select trx.id_transaksi,trx.jumlah_transaksi,c.nama_customer 
from public.customers c 
join
(select mdt.customer_id ,t.id_transaksi,t.jumlah_transaksi
from public.master_data_tabungan mdt 
join
(select ts.id_transaksi ,sst.no_rekening ,ts.jumlah_transaksi 
from public.saldo_sisa_tabungan sst 
join
public.transaksi_simpanan ts 
on ts.id_transaksi=sst.id_transaksi) t 
on t.no_rekening=mdt.no_rekening ) trx
on trx.customer_id=c.customer_id 
order by c.tanggal_lahir
