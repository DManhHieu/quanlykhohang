package QLKH.DAO;

import QLKH.models.HangNhap;
import QLKH.models.PhieuNhapHang;
import QLKH.until.HibernaterUtil;
import org.hibernate.Query;
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
            Query query=session.createQuery("from HangNhap where hangNhapId.MP_Nhap = :MaPhieu");
            query.setParameter("MaPhieu",MaPhieuNhap);
            List<HangNhap> hangNhaps=query.getResultList();
            phieuNhapHang.setHangNhaps(hangNhaps);
        } catch (Exception e){
            e.printStackTrace();
        }
        return phieuNhapHang;
    }
}
