select tab.nama_customer,tab.no_rekening,pinj.register_pinjaman
from
(select c.customer_id ,c.nama_customer,mdt.no_rekening ,to_char(mdt.tanggal_buka_rekening,'dd-mm-yyyy') 
from public.customers c 
join
public.master_data_tabungan mdt 
on mdt.customer_id =c.customer_id ) tab
join 
(select c.customer_id,to_char(mdp.tanggal_buka_pinjaman,'dd-mm-yyyy') as register_pinjaman 
from public.customers c 
join public.master_data_pinjaman mdp 
on mdp.customer_id =c.customer_id) pinj
on pinj.customer_id=tab.customer_id
