package QLKH.DAO;

import QLKH.models.HangHoa;
import QLKH.models.PhieuXuatHang;
import QLKH.until.HibernaterUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class PhieuXuatHangDAO {
    public List<PhieuXuatHang> getPhieuXuatHangs(){
        Transaction transaction=null;
        List<PhieuXuatHang> phieuXuatHangs=null;
        try(Session session= HibernaterUtil.getSessionFactory().openSession()){

            transaction=session.beginTransaction();
            phieuXuatHangs=session.createQuery("from PhieuXuatHang").getResultList();
            transaction.commit();
        }
        catch (Exception e){
            if(transaction!=null){
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return phieuXuatHangs;
    }
}
