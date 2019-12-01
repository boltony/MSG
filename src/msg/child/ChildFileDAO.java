package msg.child;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

public class ChildFileDAO {
	private BasicDataSource bds = new BasicDataSource();

	private ChildFileDAO() {
		bds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		bds.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
		bds.setUsername("msg");
		bds.setPassword("msg");
		bds.setInitialSize(30);
	}

	private static ChildFileDAO instance;

	public synchronized static ChildFileDAO getInstance() {  // synchronized를 작성하면 한 번에 하나의 thread만 접속 가능함
		if(instance == null) {  // 첫 번째 사람만 instance를 만들고, 두 번째 사람부터는 만들어진 instance를 사용함
			instance = new ChildFileDAO();
		}
		return instance;
	}

	public Connection getConnection() throws Exception {
		return bds.getConnection();
	}

	public int insert(ChildFileDTO dto) throws Exception {
		String sql = "insert into missing_child_file values(child_file_seq.nextval, ?, ?, ?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, dto.getRoot());
			pstat.setString(2, dto.getFile_name());
			pstat.setString(3, dto.getOriginal_file_name());
			int result = pstat.executeUpdate();

			con.commit();
			return result;
		}
	}

	public int isFileExist(int root) throws Exception {
		String sql = "select * from missing_child_file where root = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, root);
			int result = pstat.executeUpdate();

			con.commit();
			return result;
		}
	}

	public List<ChildFileDTO> getFilesByPost(int root) throws Exception {
		String sql = "select * from missing_child_file where root = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, root);
			try(
					ResultSet rs = pstat.executeQuery();					
					){
				List<ChildFileDTO> list = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt(1);
					String file_name = rs.getString(3);
					String original_file_name = rs.getString(4);

					ChildFileDTO dto = new ChildFileDTO(seq, root, file_name, original_file_name);

					list.add(dto);
				}
				
				con.commit();
				return list;
			}
		}
	}
}
