<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="kampus.Kelas" %>
<%
    // inisialisasi objek
    String hasil = "";
    Kelas kelas = new Kelas();
    
    String mode = request.getParameter("mode");
    if (mode==null) {
        mode = "insert";    
    } else if (mode.equals("insert")) { // operasi INSERT
        kelas.kode = request.getParameter("kode");
        kelas.dosenNid = request.getParameter("dosenNid");
        kelas.status = request.getParameter("status");
        kelas.tambah();
        mode = "update";
        hasil = "Berhasil ditambahkan";
    } else if (mode.equals("update")) {
        kelas.baca(request.getParameter("kode"));        
        kelas.kode = request.getParameter("kode");
        kelas.dosenNid = request.getParameter("dosenNid");
        kelas.status = request.getParameter("status");
        kelas.update();
        mode = "update";
        hasil = "Berhasil disimpan";
    } else if (mode.equals("baca")) {
        mode = "update";
        kelas.baca(request.getParameter("kode"));        
    }
    


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Data ke MySql</title>
    </head>
    <body>

        <h1>Form Data</h1>
        <form action="form_kelas.jsp" method="post" >
            <input value="<%=mode%>" name="mode">
            Kode : <input name="kode" value="<%=kelas.kode%>">
            NID Dosen : <input name="dosenNid" value="<%=kelas.dosenNid %>"><br>
            Status: <input name="status" value="<%=kelas.status%>"><br>
            
            <button type="submit">Simpan</button>
        </form>
        <a href="form_kelas.jsp">Tambah</a> - 
                <a href="index.jsp">Kembali ke halaman depan</a>

            <%=hasil%>
        <%=kelas.getErrMsg() %>

        <form action="dotambah_peserta.jsp" method="post">
            <input name="kelasKode">
            <input name="nim">
            <button>Tambah Peserta</button>
        </form>

        
        
    </body>
</html>
