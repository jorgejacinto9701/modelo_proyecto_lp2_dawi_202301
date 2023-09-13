package com.centroinformacion.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.centroinformacion.entity.Opcion;
import com.centroinformacion.entity.Rol;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.UsuarioService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

	@Autowired
	private UsuarioService servicio;

	@PostMapping("/login")
	public String login(Usuario user, HttpSession session, HttpServletRequest request) {
		Usuario usuario = servicio.login(user);
		if (usuario == null) {
			request.setAttribute("mensaje", "El usuario no existe");
			return "intranetLogin";
		} else {
			List<Opcion> menus = servicio.traerEnlacesDeUsuario(usuario.getIdUsuario());
			List<Rol> roles = servicio.traerRolesDeUsuario(usuario.getIdUsuario());

			session.setAttribute("objUsuario", usuario);
			session.setAttribute("objMenus", menus);
			session.setAttribute("objRoles", roles);

			return "intranetHome";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		session.invalidate();

		response.setHeader("Cache-control", "no-cache");
		response.setHeader("Expires", "0");
		response.setHeader("Pragma", "no-cache");

		request.setAttribute("mensaje", "El usuario salió de sesión");
		return "intranetLogin";

	}

}
