<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="kampus.Kelas" %>
<%
    List<Kelas> daftar = Kelas.getList();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Data Kelas</title>
    </head>
    <body>
        <table>
            <thead>
                <tr>
                    <th>Kode Kelas</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <% for (Kelas row : daftar) {%>
                <tr>
                    <td><%=row.kode%></td>
                    <td><a href="form_kelas.jsp?mode=baca&kode=<%=row.kode%>">edit</a></td>
                </tr>
                <% }%>
            </tbody>
        </table>
        <a href="form_kelas.jsp">Tambah</a> - 
        <a href="index.jsp">Kembali ke halaman depan</a>
    </body>
</html>
