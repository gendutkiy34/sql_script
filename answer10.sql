select distinct cust.nama_customer
from 
(select c.nama_customer ,mdt.no_rekening 
from public.customers c 
join public.master_data_tabungan mdt 
on mdt.customer_id =c.customer_id ) cust
join 
(select distinct sst.no_rekening 
from public.saldo_sisa_tabungan sst 
join
public.transaksi_simpanan ts 
on ts.id_transaksi = sst.id_transaksi 
where to_char(ts.waktu_transaksi,'dd-mm-yyyy') = '09-05-2021' ) trx
on trx.no_rekening = cust.no_rekening
