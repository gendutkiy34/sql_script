select c.customer_id ,count(c.customer_id) as frequency_transaction,sum(trx.jumlah_transaksi) as total
from public.customers c 
join
(select mdt.customer_id ,t.jumlah_transaksi
from public.master_data_tabungan mdt 
join
(select sst.no_rekening ,ts.jumlah_transaksi 
from public.saldo_sisa_tabungan sst 
join
public.transaksi_simpanan ts 
on ts.id_transaksi=sst.id_transaksi 
where sst.tipe_transaksi ='Debit') t
on t.no_rekening=mdt.no_rekening ) trx
on trx.customer_id=c.customer_id 
group by c.customer_id
