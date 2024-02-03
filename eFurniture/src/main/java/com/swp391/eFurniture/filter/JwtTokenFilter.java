package com.swp391.eFurniture.filter;

import com.swp391.eFurniture.components.JwtTokenUtil;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.data.util.Pair;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@Component
@RequiredArgsConstructor
public class JwtTokenFilter extends OncePerRequestFilter {
    private final UserDetailsService userDetailsService;
    private final JwtTokenUtil jwtTokenUtil;
    @Override
    protected void doFilterInternal(@NonNull HttpServletRequest request,
                                    @NonNull HttpServletResponse response,
                                    @NonNull FilterChain filterChain)
            throws ServletException, IOException {
        try {
            if (isByPassToken(request)){
                filterChain.doFilter(request,response); // cho di qua
            }
            final String authHeader = request.getHeader("Authorization");
            if (authHeader == null || !authHeader.startsWith("Bearer ")){
                return;
            }
            final String token = authHeader.substring(7);
            final String username = jwtTokenUtil.extractUsername(token);
            if (username != null && SecurityContextHolder.getContext().getAuthentication() == null){
                User userDetails = (User) userDetailsService.loadUserByUsername(username);
                if (jwtTokenUtil.validateToken(token, userDetails)){
                    UsernamePasswordAuthenticationToken authenticationToken =
                            new UsernamePasswordAuthenticationToken(
                                    userDetails,
                                    null,
                                    userDetails.getAuthorities()
                            );
                    authenticationToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                    SecurityContextHolder.getContext().setAuthentication(authenticationToken);
                }
            }

            filterChain.doFilter(request,response);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }

    }

    private boolean isByPassToken(@NonNull HttpServletRequest request){
        final List<Pair<String, String>> byPassTokens = Arrays.asList(
                Pair.of("home", "GET"),
                Pair.of("users/register", "GET"),
                Pair.of("users/login", "GET"),
                Pair.of("users/login", "POST"),
                Pair.of("/css/", "GET"),
                Pair.of("/fonts/", "GET"),
                Pair.of("/js/", "GET")
        );
        for (Pair<String, String> byPassToken : byPassTokens){
            if (request.getServletPath().contains(byPassToken.getFirst()) &&
            request.getMethod().equals(byPassToken.getSecond())){
                return true;
            }
        }
        return false;
    }
}
