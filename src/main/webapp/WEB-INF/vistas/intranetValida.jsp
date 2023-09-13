<%@page import="com.centroinformacion.entity.Usuario"%>
<% 
   Usuario objUsuario = (Usuario) session.getAttribute("objUsuario"); 
   if (objUsuario == null){
	   request.setAttribute("mensaje", "Debe autenticarse para ingresar al sistema");
	   request.getRequestDispatcher("/WEB-INF/vistas/intranetLogin.jsp").forward(request, response);
   } 
%>

