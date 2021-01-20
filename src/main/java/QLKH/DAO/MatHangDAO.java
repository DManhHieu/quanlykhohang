package QLKH.DAO;

import QLKH.models.MatHang;
import QLKH.models.NhanVien;
import QLKH.until.HibernaterUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class MatHangDAO {
    public List<MatHang> getMatHangs() {
        Transaction transaction = null;
        List<MatHang> matHangs = null;
        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            matHangs = session.createQuery("from MatHang ").getResultList();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return matHangs;
    }
//    public List<HangHoa> getHangHoa_thh(String TenMatHang){
//        Transaction transaction = null;
//        List<HangHoa> hangHoas = null;
//        MatHang matHang = null;
//        try (Session session = HibernaterUtil.getSessionFactory().openSession()){
//            transaction = session.getTransaction();
//            Query query= session.createQuery("from MatHang WHERE TenMatHang= :TenMatHang");
//            query.setParameter("TenMatHang", TenMatHang);
//            List queryList = query.list();
//            if (queryList != null && !queryList.isEmpty()) {
//                matHang = (MatHang) queryList.get(0);
//            }
//            hangHoas=matHang.getHangHoas();
//            transaction.commit();
//        } catch (Exception e){
//            e.printStackTrace();
//        }
//        return hangHoas;
//    }
    public MatHang getMatHang(String MaMatHang) {
        Transaction transaction = null;
        MatHang matHang = null;
        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {
            transaction = session.getTransaction();
            matHang = session.get(MatHang.class, MaMatHang);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return matHang;
    }
    public void UpdateMatHang(MatHang matHang) {
        Transaction transaction = null;
        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            matHang.setNguoiNhap(session.get(NhanVien.class, matHang.getNguoiNhap().getMaNhanVien()));
            session.update(matHang);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public void AddMatHang(MatHang matHang) {
        Transaction transaction = null;
        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            matHang.setNguoiNhap(session.get(NhanVien.class, matHang.getNguoiNhap().getMaNhanVien()));
            session.save(matHang);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public String CheckMaMatHang(String maMatHang) {
        Transaction transaction = null;
        String messager=null;
        MatHang matHang = null;
        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {
            transaction = session.getTransaction();
            matHang = session.get(MatHang.class, maMatHang);
            if(matHang!=null){
                messager="Mã mặt hàng đã tồn tại";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return messager;
    }
    public String MaMatHangMoi(){
        Transaction transaction = null;
        long count = 0;
        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {
            transaction = session.getTransaction();
            count = (long) session.createQuery(" SELECT  count (*) from MatHang").getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "MH" + (count+1);
    }
}
