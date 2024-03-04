/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lodemetz <lodemetz@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/19 11:51:05 by louis.demet       #+#    #+#             */
/*   Updated: 2023/11/21 17:43:03 by lodemetz         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FT_PRINTF_H
# define FT_PRINTF_H

# include "libft/libft.h"
# include <stdint.h>
# include <stdarg.h>

void	put_c(char c, int *count);
void	put_s(char *s, int *count);
void	put_p(void *ptr, int *count);
void	put_i(int i, int *count);
void	put_u(unsigned int u, int *count);
void	put_x(unsigned int u, int *count);
void	put_cap_x(unsigned int u, int *count);
int		ft_printf(const char *str, ...);
void	select_specifier(char *str, va_list args, int *count);

#endif
