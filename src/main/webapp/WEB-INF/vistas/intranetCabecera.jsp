<%@page import="com.centroinformacion.entity.Opcion"%>
<%@page import="java.util.List"%>
<div class="container">
 <div class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>
    
    <div class="collapse navbar-collapse">
    <ul class="nav navbar-nav navbar-left">
       	<li><a href="verIntranetHome">Home</a></li>
    </ul>
    <% List<Opcion> objMenus = (List<Opcion>) session.getAttribute("objMenus"); %>
    
    <ul class="nav navbar-nav">
    	<li class="dropdown">
	        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	          Registros (PC1)<b class="caret"></b>
	        </a>
	        <ul class="dropdown-menu">
			<% for (Opcion x: objMenus) {  
				if ( x.getTipo() == 1) { %>
				   <li>
		        		<a href="<%= x.getRuta() %>"><%= x.getNombre() %></a></li>
	          <% }} %>	
	        </ul>
     	</li>
     	
     	<li class="dropdown">
	        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	          CRUD (PC2)<b class="caret"></b>
	        </a>
	        <ul class="dropdown-menu">
			<% for (Opcion x: objMenus) {  
				if ( x.getTipo() == 3) { %>
				   <li>
		        		<a href="<%= x.getRuta() %>"><%= x.getNombre() %></a></li>
	          <% }} %>	
	        </ul>
     	</li>   	
     	
     	<li class="dropdown">
	        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	          Consulta y Reporte (PC3)<b class="caret"></b>
	        </a>
	        <ul class="dropdown-menu">
			<% for (Opcion x: objMenus) {  
				if ( x.getTipo() == 2) { %>
				   <li>
		        		<a href="<%= x.getRuta() %>"><%= x.getNombre() %></a></li>
	          <% }} %>	
	        </ul>
     	</li>
     	
     	<li class="dropdown">
	        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	          Transacciones (AP)<b class="caret"></b>
	        </a>
	        <ul class="dropdown-menu">
			<% for (Opcion x: objMenus) {  
				if ( x.getTipo() == 4) { %>
				   <li>
		        		<a href="<%= x.getRuta() %>"><%= x.getNombre() %></a></li>
	          <% }} %>	
	        </ul>
     	</li>   
     	
     </ul>
      
     <ul class="nav navbar-nav navbar-right">
       	<li><a href="logout">Salir</a></li>
     </ul>
      
    </div>
  </div>
</div>  
</div>