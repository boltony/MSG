package msg.support;

import java.sql.Connection;
import java.sql.PreparedStatement;

import msg.utils.Statics;

public class SupportDAO {
	private static SupportDAO instance;
	
	public synchronized static SupportDAO getInstance() {
		if(instance == null) {
			instance = new SupportDAO();	
		}

		return instance;
	}
	public Connection getConnection() throws Exception{

		return Statics.bds.getConnection();

	}
	public int insertSupport(SupportDTO dto) throws Exception{
		String sql ="insert into Support values(support_seq.nextval,?,?,?,?,?,?,?,?,?,?,?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getName());
			pstat.setString(3, dto.getPhone());
			pstat.setString(4, dto.getEmail());
			pstat.setString(5, dto.getCard_name());
			pstat.setString(6, dto.getMethod_name());
			pstat.setString(7, dto.getPg());
			pstat.setInt(8, dto.getDonation());
			pstat.setTimestamp(9, dto.getSupport_date());
			pstat.setString(10, dto.getReceipt_id());
			pstat.setString(11, dto.getAgency_name());

			int result = pstat.executeUpdate();
			return result;
		}
	}
	public int deleteSupport(String receipt_id) throws Exception{
		String sql = "delete from support where receipt_id=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, receipt_id);

			int result = pstat.executeUpdate();
			return result;
		}
	}
}
