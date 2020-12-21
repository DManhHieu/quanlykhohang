package QLKH.DAO;

import QLKH.models.MatHang;
import QLKH.until.HibernaterUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class MatHangDAO {
    public List<MatHang> getMatHangs(){
        Transaction transaction=null;
        List<MatHang> matHangs=null;
        try(Session session= HibernaterUtil.getSessionFactory().openSession()){
            transaction=session.beginTransaction();
            matHangs=session.createQuery("from MatHang ").getResultList();
            transaction.commit();
        }
        catch (Exception e){
            if(transaction!=null){
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return matHangs;
    }
    public MatHang getMatHang(String MaMatHang){
        Transaction transaction=null;
        MatHang matHang=null;
        try(Session session=HibernaterUtil.getSessionFactory().openSession()){
            transaction=session.getTransaction();
            matHang=session.get(MatHang.class,MaMatHang);
        } catch (Exception e){
            e.printStackTrace();
        }
        return matHang;
    }
}
