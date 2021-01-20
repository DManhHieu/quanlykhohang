package QLKH.DAO;

import QLKH.models.HangHoa;
import QLKH.until.HibernaterUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class HangHoaDAO {
    public List<HangHoa> getHangHoas() {
        Transaction transaction = null;
        List<HangHoa> hangHoas = null;
        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            hangHoas = session.createQuery("from HangHoa").getResultList();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return hangHoas;
    }
    public List<HangHoa> getHangHoa_thh(String TenMatHang){
        Transaction transaction = null;
        List<HangHoa> hangHoas = null;
        try (Session session = HibernaterUtil.getSessionFactory().openSession()){
            transaction = session.beginTransaction();
            Query query = session.createQuery("from HangHoa where matHang.TenMatHang= :TenMatHang");
            query.setParameter("TenMatHang",TenMatHang);
            List queryList = query.list();
            hangHoas=queryList;
            transaction.commit();
        }  catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return hangHoas;
    }
    public List<HangHoa> getHangHoa_vt(String Vitri){
        Transaction transaction = null;
        List<HangHoa> hangHoas = null;
        try (Session session = HibernaterUtil.getSessionFactory().openSession()){
            transaction = session.beginTransaction();
            Query query = session.createQuery("from HangHoa where ViTri= :Vitri");
            query.setParameter("Vitri",Vitri);
            List queryList = query.list();
            hangHoas=queryList;
            transaction.commit();
        }  catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return hangHoas;
    }

    public List<HangHoa> getHangHoa_tt(String TinhTrang){
        Transaction transaction = null;
        List<HangHoa> hangHoas = null;
        try (Session session = HibernaterUtil.getSessionFactory().openSession()){
            transaction = session.beginTransaction();
            Query query = session.createQuery("from HangHoa where tinhTrang.TenTinhTrang= :TinhTrang");
            query.setParameter("TinhTrang",TinhTrang);
            List queryList = query.list();
            hangHoas=queryList;
            transaction.commit();
        }  catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return hangHoas;
    }

    public HangHoa getHangHoa(String MaHangHoa) {
        Transaction transaction = null;
        HangHoa hangHoa = null;
        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            hangHoa = session.get(HangHoa.class, MaHangHoa);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return hangHoa;
    }

    public HangHoa getHangHoaTonKho(String MaHangHoa) {
        Transaction transaction = null;
        HangHoa hangHoa = null;
        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            Query query = session.createQuery("from HangHoa where MaHangHoa= :MaHangHoa AND( tinhTrang.MaTinhTrang=1 or tinhTrang.MaTinhTrang=2 or tinhTrang.MaTinhTrang=3)" +
                    "AND PhieuXuat=null");
            query.setParameter("MaHangHoa", MaHangHoa);
            List queryList = query.list();
            if (queryList != null && !queryList.isEmpty()) {
                hangHoa = (HangHoa) queryList.get(0);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return hangHoa;
    }

    public void AddHangHoa(HangHoa hangHoa) {
        Transaction transaction = null;
        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            hangHoa.setNhanVienKiemKe(null);
            hangHoa.setNhanVienXuatKho(null);
            hangHoa.setPhieuXuat(null);
            hangHoa.setNgay_KiemKe(null);
            session.save(hangHoa);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public void updateHangHoa(HangHoa hangHoa) {
        Transaction transaction = null;
        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.update(hangHoa);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
    public String MaHangHoaMoi(String MaPhieuNhap, String MaMatHang){
        Transaction transaction = null;
        long count = 0;
        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {
            transaction = session.getTransaction();
            Query query  = session.createQuery(" SELECT  count (*) from HangHoa WHERE matHang.MaMatHang=:MaMatHang and PhieuNhap.MaPhieu=:MaPhieuNhap");
            query.setParameter("MaMatHang", MaMatHang);
            query.setParameter("MaPhieuNhap", MaPhieuNhap);
            count=(long)query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return MaPhieuNhap+MaMatHang+ (count+1);
    }
}
