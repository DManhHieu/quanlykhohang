package QLKH.DAO;

import QLKH.models.*;
import QLKH.until.HibernaterUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class PhieuNhapHangDao {
    public List<PhieuNhapHang> getPhieuNhapHangs() {
        Transaction transaction = null;
        List<PhieuNhapHang> phieuNhapHangs = null;
        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            phieuNhapHangs = session.createQuery("from PhieuNhapHang").getResultList();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return phieuNhapHangs;
    }

    public PhieuNhapHang getPhieuHangNhap(String MaPhieuNhap) {
        Transaction transaction = null;
        PhieuNhapHang phieuNhapHang = null;
        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {
            transaction = session.getTransaction();
            phieuNhapHang = session.get(PhieuNhapHang.class, MaPhieuNhap);
            Query query = session.createQuery("from HangNhap where hangNhapId.MP_Nhap = :MaPhieu");
            query.setParameter("MaPhieu", MaPhieuNhap);
            List<HangNhap> hangNhaps = query.getResultList();
            phieuNhapHang.setHangNhaps(hangNhaps);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return phieuNhapHang;
    }

    public void AddPhieuNhapHang(PhieuNhapHang phieuNhapHang) {
        Transaction transaction = null;
        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            phieuNhapHang.setNguoiNhap(session.get(NhanVien.class, phieuNhapHang.getNguoiNhap().getMaNhanVien()));
            session.save(phieuNhapHang);
            for (HangNhap hang : phieuNhapHang.getHangNhaps()
            ) {
                hang.setMaPhieuNhap(phieuNhapHang.getMaPhieu());
                hang.setPhieuNhapHang(phieuNhapHang);
                session.save(hang);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
    public String CheckMaPhieu(String MaPhieu){
        Transaction transaction = null;
        String messager=null;
        PhieuNhapHang phieuNhapHang = null;
        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {
            transaction = session.getTransaction();
            phieuNhapHang = session.get(PhieuNhapHang.class, MaPhieu);
            if(phieuNhapHang!=null){
                messager="Mã phiếu đã tồn tại";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return messager;
    }
    public String MaPhieuMoi(){
        Transaction transaction = null;
        long count = 0;
        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {
            transaction = session.getTransaction();
            count = (long) session.createQuery(" SELECT  count (*) from PhieuNhapHang").getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "NH" + (count+1);
    }
}
