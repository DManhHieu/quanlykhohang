package QLKH.DAO;

import QLKH.models.*;
import QLKH.until.HibernaterUtil;
import com.google.gson.Gson;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.sql.Date;
import java.util.*;

public class ThongKeDAO {
    public String ThongKeHangTonKho(){
        Gson gsonObj = new Gson();
        Map<Object,Object> map = null;
        List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
        Transaction transaction=null;
        try(Session session= HibernaterUtil.getSessionFactory().openSession()){
            transaction=session.beginTransaction();
            int year = Calendar.getInstance().get(Calendar.YEAR);
            for(int i=1;i<12;i++){
                Date date= Date.valueOf(year+"-"+i+"-1");
                Date date1=Date.valueOf(year+"-"+(i+1)+"-1");
                Query query =session.createQuery("from HangHoa where NgayNhapKho>=:date and (PhieuXuat=null or PhieuXuat.NgayXuat_ThucTe<=:date1)");
                query.setParameter("date",date);
                query.setParameter("date1",date1);
                List<HangHoa> hangHoas=query.getResultList();
                map = new HashMap<Object,Object>(); map.put("x", i); map.put("y", hangHoas.size()); list.add(map);
            }
            Date date= Date.valueOf(year+"-"+12+"-1");
            Date date1=Date.valueOf((year+1)+"-"+1+"-1");
            Query query =session.createQuery("from HangHoa where NgayNhapKho>=:date and (PhieuXuat=null or PhieuXuat.NgayXuat_ThucTe<=:date1)");
            query.setParameter("date",date);
            query.setParameter("date1",date1);
            List<HangHoa> hangHoas=query.getResultList();
            map = new HashMap<Object,Object>(); map.put("x", 12); map.put("y", hangHoas.size()); list.add(map);

        }
        catch (Exception e){
            if(transaction!=null){
                transaction.rollback();
            }
            e.printStackTrace();
        }
        String dataPoints1 = gsonObj.toJson(list);
        return dataPoints1;
    }
    public int TongSoMatHang(){
        Transaction transaction=null;
        int soluong=0;
        try(Session session= HibernaterUtil.getSessionFactory().openSession()){
            transaction=session.beginTransaction();
            List<MatHang> matHangs= session.createQuery("from MatHang ").getResultList();
            soluong=matHangs.size();
        }
        catch (Exception e){
            if(transaction!=null){
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return soluong;
    }
    public int SoHangHoa(){
        Transaction transaction=null;
        int soluong=0;
        try(Session session= HibernaterUtil.getSessionFactory().openSession()){
            transaction=session.beginTransaction();
            List<MatHang> matHangs= session.createQuery("from MatHang ").getResultList();
            soluong=matHangs.size();
        }
        catch (Exception e){
            if(transaction!=null){
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return soluong;
    }
    public int SoHangHoaTonKho(){
        Transaction transaction=null;
        int soluong=0;
        try(Session session= HibernaterUtil.getSessionFactory().openSession()){
            List<MatHang> matHangs= session.createQuery("from MatHang where (TinhTrang .MaTinhTrang=1 or TinhTrang .MaTinhTrang=3)").getResultList();
            soluong=matHangs.size();
        }
        catch (Exception e){

            e.printStackTrace();
        }
        return soluong;
    }
    public int SoPhieuNhapHang(){
        Transaction transaction=null;
        int soluong=0;
        try(Session session= HibernaterUtil.getSessionFactory().openSession()){
            transaction=session.beginTransaction();
            List<PhieuNhapHang> phieuNhapHangs= session.createQuery("from PhieuNhapHang ").getResultList();
            soluong=phieuNhapHangs.size();
        }
        catch (Exception e){
            if(transaction!=null){
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return soluong;
    }
    public int SoPhieuXuatHang(){
        Transaction transaction=null;
        int soluong=0;
        try(Session session= HibernaterUtil.getSessionFactory().openSession()){
            transaction=session.beginTransaction();
            List<PhieuXuatHang> phieuXuatHangs= session.createQuery("from PhieuXuatHang ").getResultList();
            soluong=phieuXuatHangs.size();
        }
        catch (Exception e){
            if(transaction!=null){
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return soluong;
    }
    public int SoNhanVien(){
        Transaction transaction=null;
        int soluong=0;
        try(Session session= HibernaterUtil.getSessionFactory().openSession()){
            transaction=session.beginTransaction();
            List<NhanVien> nhanViens= session.createQuery("from NhanVien ").getResultList();
            soluong=nhanViens.size();
        }
        catch (Exception e){
            if(transaction!=null){
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return soluong;
    }
}
