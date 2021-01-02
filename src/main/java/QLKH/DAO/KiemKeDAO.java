package QLKH.DAO;

import QLKH.models.HangHoa;
import QLKH.models.MatHang;
import QLKH.models.PhieuNhapHang;
import QLKH.models.TinhTrang;
import QLKH.until.HibernaterUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class KiemKeDAO {
    public void KiemKeMatHangs(List<MatHang> matHangs) {
        Transaction transaction = null;
        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {

            transaction = session.beginTransaction();
            TinhTrang tinhTrang = session.get(TinhTrang.class, 2);
            for (MatHang mathang : matHangs) {
                Query query = session.createQuery("from HangHoa where matHang.MaMatHang=:mamathang and (tinhTrang.MaTinhTrang=1 or tinhTrang.MaTinhTrang=3) ");
                query.setParameter("mamathang", mathang.getMaMatHang());
                List<HangHoa> hangHoas = query.getResultList();
                for (HangHoa hangHoa : hangHoas) {
                    hangHoa.setTinhTrang(tinhTrang);
                }
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public void KiemKeMatHang(MatHang matHang) {
        Transaction transaction = null;
        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {

            transaction = session.beginTransaction();
            TinhTrang tinhTrang = session.get(TinhTrang.class, 2);
            Query query = session.createQuery("from HangHoa where matHang.MaMatHang=:mamathang and (tinhTrang.MaTinhTrang=1 or tinhTrang.MaTinhTrang=3) ");
            query.setParameter("mamathang", matHang.getMaMatHang());
            List<HangHoa> hangHoas = query.getResultList();
            for (HangHoa hangHoa : hangHoas) {
                hangHoa.setTinhTrang(tinhTrang);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public void KiemKePhieuNhapHangs(List<PhieuNhapHang> phieuNhapHangs) {
        Transaction transaction = null;

        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {

            transaction = session.beginTransaction();
            TinhTrang tinhTrang = session.get(TinhTrang.class, 2);
            for (PhieuNhapHang phieu : phieuNhapHangs) {
                Query query = session.createQuery("from HangHoa where PhieuNhap.MaPhieu=:maphieu and (tinhTrang.MaTinhTrang=1 or tinhTrang.MaTinhTrang=3) ");
                query.setParameter("maphieu", phieu.getMaPhieu());
                List<HangHoa> hangHoas = query.getResultList();
                for (HangHoa hangHoa : hangHoas) {
                    hangHoa.setTinhTrang(tinhTrang);
                }
            }

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public void KiemKePhieuNhapHang(PhieuNhapHang phieuNhapHang) {
        Transaction transaction = null;

        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {

            transaction = session.beginTransaction();
            TinhTrang tinhTrang = session.get(TinhTrang.class, 2);
            Query query = session.createQuery("from HangHoa where PhieuNhap.MaPhieu=:maphieu and (tinhTrang.MaTinhTrang=1 or tinhTrang.MaTinhTrang=3) ");
            query.setParameter("maphieu", phieuNhapHang.getMaPhieu());
            List<HangHoa> hangHoas = query.getResultList();
            for (HangHoa hangHoa : hangHoas) {
                hangHoa.setTinhTrang(tinhTrang);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public void KiemKeToanBo() {
        Transaction transaction = null;

        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {

            transaction = session.beginTransaction();
            TinhTrang tinhTrang = session.get(TinhTrang.class, 2);
            List<HangHoa> hangHoas = session.createQuery("from HangHoa " +
                    "where (tinhTrang.MaTinhTrang=1 or tinhTrang.MaTinhTrang=3) ").getResultList();
            for (HangHoa hangHoa : hangHoas) {
                hangHoa.setTinhTrang(tinhTrang);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public void KiemKeHang(HangHoa hangHoa) {
        Transaction transaction = null;

        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {

            transaction = session.beginTransaction();
            TinhTrang tinhTrang = session.get(TinhTrang.class, 2);
            hangHoa.setTinhTrang(tinhTrang);
            session.update(hangHoa);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public void KiemKeHangs(List<HangHoa> hangHoas) {
        Transaction transaction = null;

        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {

            transaction = session.beginTransaction();
            TinhTrang tinhTrang = session.get(TinhTrang.class, 2);
            for (HangHoa hangHoa : hangHoas) {
                hangHoa.setTinhTrang(tinhTrang);
                session.update(hangHoa);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
}
