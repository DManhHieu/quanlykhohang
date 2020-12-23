package QLKH.DAO;

import QLKH.models.NhanVien;
import QLKH.until.HibernaterUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class NhanVienDAO {
    public NhanVien Login(String tendangnhap, String matkhau){

        try (Session session = HibernaterUtil.getSessionFactory().openSession()){

            Query query=session.createQuery("from NhanVien nv where nv.TenDangNhap = :tendangnhap");
            query.setParameter("tendangnhap",tendangnhap);
            List queryList=query.list();
            if(queryList!=null&& queryList.isEmpty()){
                return null;
            }
            else {
                NhanVien nv=(NhanVien) queryList.get(0);
                if(nv.getMatKhau().equals(matkhau))
                    return nv;
                return null;
            }
        }
        catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
    public List<NhanVien> gets(){
        Transaction transaction=null;
        List<NhanVien> nhanViens=null;
        try(Session session= HibernaterUtil.getSessionFactory().openSession()){
            transaction=session.beginTransaction();
            nhanViens=session.createQuery("from NhanVien ").getResultList();
            transaction.commit();
        }
        catch (Exception e){
            if(transaction!=null){
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return nhanViens;
    }
    public NhanVien get(int MaNhanVien){
        Transaction transaction=null;
        NhanVien nhanVien=null;
        try(Session session=HibernaterUtil.getSessionFactory().openSession()){
            transaction=session.getTransaction();
            nhanVien=session.get(NhanVien.class,MaNhanVien);
        } catch (Exception e){
            e.printStackTrace();
        }
        return nhanVien;
    }
    public void Update(NhanVien nhanVien){
        Transaction transaction=null;
        try(Session session= HibernaterUtil.getSessionFactory().openSession()){
            transaction=session.beginTransaction();
            session.update(nhanVien);
            transaction.commit();
        }catch (Exception e){
            if(transaction!=null){
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
    public void Add(NhanVien nhanVien){
        Transaction transaction=null;
        try(Session session= HibernaterUtil.getSessionFactory().openSession()){
            transaction=session.beginTransaction();
            session.save(nhanVien);
            transaction.commit();
        }catch (Exception e){
            if(transaction!=null){
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
}
