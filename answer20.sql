select c.nama_customer ,min(rek.sisa_saldo)
from public.customers c 
join
(select mdt.customer_id ,mdt.no_rekening ,sst.sisa_saldo 
from public.master_data_tabungan mdt 
join public.saldo_sisa_tabungan sst 
on sst.no_rekening=mdt.no_rekening ) rek
on rek.customer_id=c.customer_id 
group by c.nama_customer
