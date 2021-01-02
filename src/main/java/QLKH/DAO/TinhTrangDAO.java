package QLKH.DAO;

import QLKH.models.TinhTrang;
import QLKH.until.HibernaterUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class TinhTrangDAO {
    public TinhTrang getTinhTrang(String TinhTrang) {
        Transaction transaction = null;
        List<TinhTrang> tinhTrangs = null;
        TinhTrang tinhTrang = new TinhTrang();
        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            tinhTrangs = session.createQuery("from TinhTrang ").getResultList();
            for (TinhTrang tt : tinhTrangs) {
                if (tt.getTenTinhTrang().equals(TinhTrang)) {
                    tinhTrang = tt;
                }
            }
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tinhTrang;
    }

    public TinhTrang getTinhTrang(int MaTinhTrang) {
        Transaction transaction = null;
        TinhTrang tinhTrang = new TinhTrang();
        try (Session session = HibernaterUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            tinhTrang = session.get(TinhTrang.class, MaTinhTrang);
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tinhTrang;
    }
}
