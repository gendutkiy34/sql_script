select mdt.no_rekening 
from public.customers c 
join
public.master_data_tabungan mdt 
on mdt.customer_id =c.customer_id 
where c.customer_id not in (
select c.customer_id 
from public.customers c 
join public.master_data_pinjaman mdp 
on mdp.customer_id =c.customer_id )
