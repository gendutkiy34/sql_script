select c.nama_customer,mdt.no_rekening 
from public.customers c
join
public.master_data_tabungan mdt 
on mdt.customer_id = c.customer_id
