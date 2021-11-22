select rek.no_rekening,rek.descripsi_status
from 
(select cust.customer_id,cust.no_rekening,dsr.descripsi_status 
from public.detail_status_rekening dsr 
join
(select c.customer_id ,mdt.no_rekening ,mdt.status_rekening 
from public.customers c 
join master_data_tabungan mdt 
on mdt.customer_id =c.customer_id ) cust
on cust.status_rekening=dsr.id_status ) rek
join 
(select c.customer_id ,to_char(c.tanggal_lahir,'yyyy')
from public.customers c 
join public.master_data_pinjaman mdp 
on mdp.customer_id =c.customer_id 
where cast(to_char(c.tanggal_lahir,'yyyy') as integer ) < 1995) pinj
on pinj.customer_id=rek.customer_id
