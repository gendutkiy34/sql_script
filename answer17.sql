select c.tanggal_lahir 
from public.customers c 
join
(select mdt.customer_id ,t.sisa_saldo
from public.master_data_tabungan mdt 
join
(select sst.no_rekening ,sst.sisa_saldo 
from public.saldo_sisa_tabungan sst 
join
public.transaksi_simpanan ts 
on ts.id_transaksi=sst.id_transaksi 
where to_char(ts.waktu_transaksi,'dd-mm-yyyy')='09-05-2021') t
on t.no_rekening=mdt.no_rekening ) trx
on trx.customer_id=c.customer_id 
where trx.sisa_saldo < 1000000
