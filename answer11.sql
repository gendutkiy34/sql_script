select cust.nama_customer,mdp.no_rekening_pinjaman 
from public.master_data_pinjaman mdp 
join
(select distinct c.customer_id ,c.nama_customer 
from
(select mdt.customer_id as custID ,lu.kantor_wilayah  as regional
from public.master_data_tabungan mdt 
join public.lokasi_unit lu 
on lu.id_unit =mdt.lokasi_pembuatan_rekening 
where lu.kantor_wilayah ='Jakarta') a
join public.customers c 
on c.customer_id =a.custID) cust
on cust.customer_id=mdp.customer_id
