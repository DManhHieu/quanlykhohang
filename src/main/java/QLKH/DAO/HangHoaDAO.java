package QLKH.DAO;

import QLKH.models.HangHoa;
import QLKH.until.HibernaterUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import org.hibernate.Query;
import java.util.List;

public class HangHoaDAO {
    public List<HangHoa> getHangHoas(){
        Transaction transaction=null;
        List<HangHoa> hangHoas=null;
        try(Session session= HibernaterUtil.getSessionFactory().openSession()){

            transaction=session.beginTransaction();
            hangHoas=session.createQuery("from HangHoa").getResultList();
            transaction.commit();
        }
        catch (Exception e){
            if(transaction!=null){
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return hangHoas;
    }
    public HangHoa getHangHoa(String MaHangHoa){
        Transaction transaction=null;
        HangHoa hangHoa=null;
        try(Session session=HibernaterUtil.getSessionFactory().openSession()){
            transaction=session.beginTransaction();
            hangHoa=session.get(HangHoa.class,MaHangHoa);
            transaction.commit();
        }
        catch (Exception e){
            if(transaction!=null){
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return hangHoa;
    }
}
