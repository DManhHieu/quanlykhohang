package QLKH.DAO;

import QLKH.models.HangHoa;
import QLKH.models.NhanVien;
import QLKH.models.PhieuXuatHang;
import QLKH.until.HibernaterUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.List;

public class PhieuXuatHangDAO {
    public List<PhieuXuatHang> getPhieuXuatHangs(){
        Transaction transaction=null;
        List<PhieuXuatHang> phieuXuatHangs=null;
        try(Session session= HibernaterUtil.getSessionFactory().openSession()){

            transaction=session.beginTransaction();
            phieuXuatHangs=session.createQuery("from PhieuXuatHang").getResultList();
            transaction.commit();
        }
        catch (Exception e){
            if(transaction!=null){
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return phieuXuatHangs;
    }
    public void AddPhieuXuatHang(PhieuXuatHang phieu){
        Transaction transaction=null;
        try(Session session= HibernaterUtil.getSessionFactory().openSession()){
            transaction=session.beginTransaction();
            phieu.setNguoiXuat(session.get(NhanVien.class,phieu.getNguoiXuat().getMaNhanVien()));
            session.save(phieu);
            for (HangHoa hang: phieu.getHangHoas()
                 ) {
                HangHoa hangHoa=session.get(HangHoa.class,hang.getMaHangHoa());
                PhieuXuatHang phieuXuatHang=session.get(PhieuXuatHang.class,phieu.getMaPhieu());
                hangHoa.setPhieuXuat(phieuXuatHang);
                session.update(hangHoa);
            }
            transaction.commit();
        }catch (Exception e){
            if(transaction!=null){
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
}
