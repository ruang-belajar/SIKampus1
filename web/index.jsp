<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="kampus.Users" %>
<%@page import="kampus.UsersMahasiswa" %>
<%@page import="kampus.UsersDosen" %>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>
<%
    Date dNow = new Date( );
    SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");    
    
    String id = "";
    String tipe = "";
    Users user;
    if (session.getAttribute("id") != null) {
        id = (String) session.getAttribute("id");
        tipe = (String) session.getAttribute("tipe");

        if (tipe.equals("DOSEN")) {
            user = new UsersDosen();
        } else {
            user = new UsersMahasiswa();
        }
        user.baca(id);

    } else {
        user = null;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Beranda: SI Kampus</title>
    </head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <body>
        <% if (id.equals("")) { %>
        <a href="login_dosen.jsp">LOGIN</a>
        <% } else {%>
        Halo <%=user.getNama()%> [<%=user.id%>] 
        <ul>
            <li><a href="data_mahasiswa.jsp" class="btn btn-primary">Mahasiswa</a></li>
            <li><a href="data_dosen.jsp" class="btn btn-info">Dosen</a></li>
            <li><a href="data_kelas.jsp" class="btn btn-info">Kelas</a></li>
            <li><a href="data_usersdosen.jsp" class="btn btn-warning">User Dosen</a></li>
            <li><a href="logout.jsp" class="btn btn-danger">🚫 Log out</a> </li>
        </ul>
        <% }%>
        <%=ft.format(dNow)%>
        <img width="300" src="https://static.vecteezy.com/system/resources/previews/006/470/647/original/university-education-logo-design-template-free-vector.jpg" >
    </body>
</html>
