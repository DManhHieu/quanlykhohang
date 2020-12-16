package QLKH.DAO;

import QLKH.models.PhieuNhapHang;
import QLKH.until.HibernaterUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;


import java.util.List;

public class PhieuNhapHangDao {
    public List<PhieuNhapHang> getPhieuNhapHangs(){
        Transaction transaction=null;
        List<PhieuNhapHang> phieuNhapHangs=null;
        try(Session session= HibernaterUtil.getSessionFactory().openSession()){
            transaction=session.beginTransaction();
            phieuNhapHangs=session.createQuery("from PhieuNhapHang").getResultList();
            transaction.commit();
        }
        catch (Exception e){
            if(transaction!=null){
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return phieuNhapHangs;
    }
    public PhieuNhapHang getPhieuHangNhap(String MaPhieuNhap){
        Transaction transaction=null;
        PhieuNhapHang phieuNhapHang=null;
        try(Session session=HibernaterUtil.getSessionFactory().openSession()){
            transaction=session.getTransaction();
            phieuNhapHang=session.get(PhieuNhapHang.class,MaPhieuNhap);
            transaction.commit();
        } catch (Exception e){
            if(transaction!=null){
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return phieuNhapHang;
    }
}
