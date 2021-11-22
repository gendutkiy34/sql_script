select max(cust.gaji)
from
(select mdt.no_rekening ,c.customer_id ,c.gaji 
from public.customers c 
join public.master_data_tabungan mdt 
on mdt.customer_id = c.customer_id ) cust
join 
(select distinct sst.no_rekening
from public.saldo_sisa_tabungan sst 
join public.transaksi_simpanan ts 
on ts.id_transaksi =sst.id_transaksi 
where to_char(ts.waktu_transaksi,'dd-mm-yyyy') = '10-05-2021') trx
on trx.no_rekening=cust.no_rekening
