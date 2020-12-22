package QLKH.DAO;

import QLKH.models.HangHoa;
import QLKH.models.PhieuNhapHang;
import QLKH.models.TinhTrang;
import QLKH.until.HibernaterUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class TinhTrangDAO {
    public TinhTrang getTinhTrang (String TinhTrang){
        Transaction transaction=null;
        List<TinhTrang> tinhTrangs=null;
        TinhTrang tinhTrang=new TinhTrang();
        try(Session session= HibernaterUtil.getSessionFactory().openSession()){
            transaction=session.beginTransaction();
            tinhTrangs=session.createQuery("from TinhTrang ").getResultList();
            for(TinhTrang tt : tinhTrangs){
                if(tt.getTenTinhTrang().equals(TinhTrang)){
                    tinhTrang=tt;
                }
            }
            transaction.commit();
        } catch (Exception e){
            e.printStackTrace();
        }
        return tinhTrang;
    }
}
