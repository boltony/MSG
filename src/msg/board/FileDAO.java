package msg.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import msg.utils.Statics;

public class FileDAO {

	private static FileDAO instance;


	public synchronized static FileDAO getInstance() {
		if (instance == null) {
			instance = new FileDAO();
		}
		return instance;
	}

	public Connection getConnection() throws Exception {
		return Statics.bds.getConnection();
	}

	public int insert(FileDTO dto) throws Exception {
		String sql = "insert into board_file values(board_file_seq.nextval,?,?,?)";
		try (Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, dto.getRoot());
			pstat.setString(2, dto.getFile_name());
			pstat.setString(3, dto.getOriginal_file_name());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	public List<FileDTO> getAllFiles(int root) throws Exception {
		String sql = "select * from board_file where root = ?";
		try (Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, root);
			try (ResultSet rs = pstat.executeQuery();) {
				List<FileDTO> list = new ArrayList<>();
				while (rs.next()) {
					int seq = rs.getInt("seq");
					String file_name = rs.getString("file_name");
					String original_file_name = rs.getString("original_file_name");
					FileDTO dto = new FileDTO(seq, root, file_name, original_file_name);
					list.add(dto);
				}
				return list;
			}
		}
	}
}