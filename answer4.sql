select mdt.no_rekening ,c.tanggal_lahir 
from public.customers c 
join public.master_data_tabungan mdt 
on mdt.customer_id =c.customer_id 
where c.jenis_kelamin ='P'
