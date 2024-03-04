NAME = libftprintf.a
LIBFT = libft/libft.a
CC = cc
CFLAGS = -Wall -Wextra -Werror -g
AR = ar
ARFLAGS = rcs
SRC = c.c i.c p.c s.c u.c x.c ft_printf.c
OBJ = $(SRC:%.c=%.o)
HEADERS = ft_printf.h libft/libft.h

# Color and Checkmark Definitions
RED=\033[0;31m
GREEN=\033[0;32m
YELLOW=\033[1;33m
CHECK=\033[0;32m✔\033[0m
NC=\033[0m # No Color

# Print Function
define print_status
	@echo "${YELLOW}====> ${1}${NC}"
endef

# Flag File
COMPILATION_FLAG_FILE=.compilation_started

all: $(NAME)

$(LIBFT):
	$(call print_status,"Compiling libft...")
	@make -C libft > /dev/null
	@echo "${CHECK} libft compiled"

$(NAME): $(LIBFT) $(OBJ) $(HEADERS)
	$(call print_status,"Creating library $(NAME)...")
	@cp $(LIBFT) $(NAME) > /dev/null
	@$(AR) $(ARFLAGS) $(NAME) $(OBJ) > /dev/null
	@echo "${CHECK} Library $(NAME) created"
	@$(RM) $(COMPILATION_FLAG_FILE)

%.o: %.c
	@if [ ! -f $(COMPILATION_FLAG_FILE) ]; then \
		echo "${YELLOW}====> Compiling ft_printf${NC}"; \
		touch $(COMPILATION_FLAG_FILE); \
	fi
	@$(CC) $(CFLAGS) -c $< -o $@ > /dev/null
	@echo "${CHECK} Compiled $<"

clean:
	$(call print_status,"Cleaning up object files...")
	@$(RM) $(OBJ) $(COMPILATION_FLAG_FILE) > /dev/null
	@make clean -C libft > /dev/null
	@echo "${CHECK} Cleanup complete"

fclean: clean
	$(call print_status,"Full clean - Removing library...")
	@$(RM) $(NAME) > /dev/null
	@make fclean -C libft > /dev/null
	@echo "${CHECK} Full cleanup complete"

re: fclean all

.PHONY: all clean fclean re
