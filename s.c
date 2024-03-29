/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   s.c                                                :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lodemetz <lodemetz@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/19 11:50:05 by louis.demet       #+#    #+#             */
/*   Updated: 2023/11/21 16:50:03 by lodemetz         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

void	put_null(char *s, int *count)
{
	while (*s)
		put_c(*s++, count);
}

void	put_s(char *s, int *count)
{
	if (!s)
	{
		put_null("(null)", count);
		return ;
	}
	while (*s)
		put_c(*s++, count);
}
