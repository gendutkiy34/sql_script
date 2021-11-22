select trx.id_transaksi
from 
(select to_char(ts.waktu_transaksi,'dd-mm-yyyy') as tanggal,ts.id_transaksi, to_char(ts.waktu_transaksi,'hh24:mm') as jam 
     , ROW_NUMBER()  over (partition by to_char(ts.waktu_transaksi,'dd-mm-yyyy') order by to_char(ts.waktu_transaksi,'hh24:mm') ) as num_trx
from public.transaksi_simpanan ts ) trx
where trx.num_trx =2
