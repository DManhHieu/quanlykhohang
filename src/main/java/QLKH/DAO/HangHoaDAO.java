package QLKH.DAO;

import QLKH.models.HangHoa;
import QLKH.until.HibernaterUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import org.hibernate.Query;

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
}
