package com.btec.security;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.btec.util.SecurityUtils;

@Component
public class CustomSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException {
		String targetUrl = determineTargetUrl(authentication);
		if (response.isCommitted()) {
			return;
		}
		redirectStrategy.sendRedirect(request, response, targetUrl);
	}

	public RedirectStrategy getRedirectStrategy() {
		return redirectStrategy;
	}
	
	public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
		this.redirectStrategy = redirectStrategy;
	}

	private String determineTargetUrl(Authentication authentication) {
		String url = "";
		List<String> roles = SecurityUtils.getAuthorities();
		if (isAdmin(roles)) {
			url = "/admin/home";
		} else if (isStaff(roles)) {
			url = "/staff/home";
		} else if (isTrainer(roles)) {
			url = "/trainer/home";
		} else if (isTrainee(roles)) {
			url = "/trainee/home";
		}
		return url;
	}

	private boolean isAdmin(List<String> roles) {
		if (roles.contains("admin")) {
			return true;
		}
		return false;
	}

	private boolean isStaff(List<String> roles) {
		if (roles.contains("staff")) {
			return true;
		}
		return false;
	}
	
	private boolean isTrainer(List<String> roles) {
		if (roles.contains("trainer")) {
			return true;
		}
		return false;
	}
	
	private boolean isTrainee(List<String> roles) {
		if (roles.contains("trainee")) {
			return true;
		}
		return false;
	}
}
