package QLKH.DAO;

import QLKH.models.NhomNhanVien;
import QLKH.until.HibernaterUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class NhomNhanVienDAO {
    public List<NhomNhanVien> gets(){
        Transaction transaction=null;
        List<NhomNhanVien> nhomNhanViens=null;
        try(Session session= HibernaterUtil.getSessionFactory().openSession()){
            transaction=session.beginTransaction();
            nhomNhanViens=session.createQuery("from NhomNhanVien ").getResultList();
            transaction.commit();
        }
        catch (Exception e){
            if(transaction!=null){
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return nhomNhanViens;
    }

    public NhomNhanVien get(int nhom) {
        Transaction transaction=null;
        NhomNhanVien nhomNhanVien=null;
        try(Session session= HibernaterUtil.getSessionFactory().openSession()){
            transaction=session.beginTransaction();
            nhomNhanVien=session.get(NhomNhanVien.class,nhom);
            transaction.commit();
        }
        catch (Exception e){
            if(transaction!=null){
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return nhomNhanVien;
    }
}
