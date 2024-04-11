<%-- 
    Document   : delete_mahasiswa
    Description: Menghapus data mahasiswa lewat GET parameter
                 cara pemanggilannya, lihat show_mahasiswa.jsp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                String connectionURL = "jdbc:mysql://localhost/test";
                Connection connection = null;
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(connectionURL, "root", "");

                if (!connection.isClosed()) {
                    // prepare select statement
                    String sql = "DELETE FROM mahasiswa WHERE nim=?";
                    PreparedStatement st = connection.prepareStatement(sql);
                    st.setString(1, request.getParameter("nim"));
                    st.executeUpdate();
                }
                connection.close();
                out.println("Data berhasil dihapus<br>");
            } catch (Exception ex) {
                out.println("Data gagal disimpan: " + ex);
            }
        %>
        <a href="index.html">Kembali ke halaman depan</a>

    </body>
</html>
