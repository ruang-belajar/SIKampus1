<%@page import="kampus.Peserta" %>
<%
    String kelasKode = request.getParameter("kelasKode");
    String nim = request.getParameter("nim");
    
    Peserta p = new Peserta();
    p.kelasKode = kelasKode;
    p.nim = nim;
    p.tambah();
    
    response.sendRedirect("form_kelas.jsp?mode=baca&kode="+kelasKode);

%>