select sst.id_transaksi
from
(select c.customer_id ,mdt.no_rekening ,c.status_nikah 
from public.customers c 
join master_data_tabungan mdt 
on mdt.customer_id =c.customer_id 
where c.status_nikah != 'Belum Kawin') cst
join public.saldo_sisa_tabungan sst 
on sst.no_rekening =cst.no_rekening
