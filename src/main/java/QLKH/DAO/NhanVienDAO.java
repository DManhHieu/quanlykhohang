package QLKH.DAO;

import QLKH.models.NhanVien;
import org.hibernate.Query;
import org.hibernate.Session;
import QLKH.until.*;
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
}
