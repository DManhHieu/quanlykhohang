package QLKH.DAO;

import QLKH.models.HangHoa;
import QLKH.models.NhanVien;
import QLKH.models.PhieuXuatHang;
import QLKH.until.HibernaterUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.sql.Date;
import java.util.List;

public class PhieuXuatHangDAO {
    public List<PhieuXuatHang> getPhieuXuatHangs() {
        Transaction transaction = null;
        List<PhieuXuatHang> phieuXuatHangs = null;
        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            phieuXuatHangs = session.createQuery("from PhieuXuatHang").getResultList();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return phieuXuatHangs;
    }

    public void AddPhieuXuatHang(PhieuXuatHang phieu) {
        Transaction transaction = null;
        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            phieu.setNguoiXuat(session.get(NhanVien.class, phieu.getNguoiXuat().getMaNhanVien()));
            session.save(phieu);
            for (HangHoa hang : phieu.getHangHoas()
            ) {
                HangHoa hangHoa = session.get(HangHoa.class, hang.getMaHangHoa());
                PhieuXuatHang phieuXuatHang = session.get(PhieuXuatHang.class, phieu.getMaPhieu());
                hangHoa.setPhieuXuat(phieuXuatHang);
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

    public PhieuXuatHang getPhieuXuatHang(String maphieu) {
        Transaction transaction = null;
        PhieuXuatHang phieuXuatHang = null;
        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            phieuXuatHang = session.get(PhieuXuatHang.class, maphieu);
            Query query = session.createQuery("from HangHoa where PhieuXuat.MaPhieu= :MaPhieu");
            query.setParameter("MaPhieu", maphieu);
            List<HangHoa> hangHoas = query.getResultList();
            transaction.commit();
            phieuXuatHang.setHangHoas(hangHoas);
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return phieuXuatHang;
    }

    public void UpdateNgayXuatHang(String MaPhieu, String NgayXuat) {
        Transaction transaction = null;
        PhieuXuatHang phieuXuatHang = null;
        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            phieuXuatHang = session.get(PhieuXuatHang.class, MaPhieu);
            Date ngayxuat = Date.valueOf(NgayXuat);
            phieuXuatHang.setNgayXuat_ThucTe(ngayxuat);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public String CheckMaPhieu(String maPhieu) {
        Transaction transaction = null;
        String messager=null;
        PhieuXuatHang phieuXuatHang = null;
        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {
            transaction = session.getTransaction();
            phieuXuatHang = session.get(PhieuXuatHang.class, maPhieu);
            if(phieuXuatHang!=null){
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
            count = (long) session.createQuery(" SELECT  count (*) from PhieuXuatHang").getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "XH" + (count+1);
    }
}
