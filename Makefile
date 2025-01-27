# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: xmatute- <xmatute-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/27 16:24:18 by xmatute-          #+#    #+#              #
#    Updated: 2025/01/27 17:25:27 by xmatute-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

define ASCII_ART
                              
      ___           ___           ___     
     /\  \         /\  \         /\__\    
    /::\  \       /::\  \       /::|  |   
   /:/\:\  \     /:/\ \  \     /:|:|  |   
  /::\~\:\  \   _\:\~\ \  \   /:/|:|__|__ 
 /:/\:\ \:\__\ /\ \:\ \ \__\ /:/ |::::\__\\
 \/__\:\/:/  / \:\ \:\ \/__/ \/__/~~/:/  /
      \::/  /   \:\ \:\__\         /:/  / 
      /:/  /     \:\/:/  /        /:/  /  
     /:/  /       \::/  /        /:/  /   
     \/__/         \/__/         \/__/    

                              
endef
export ASCII_ART

NAME := libasm.a

FNC :=	ft_strlen \
		ft_strcpy \
		ft_strcmp \
		ft_write \
		ft_read \
		ft_strdup \

SRC := $(addsuffix .s, $(FNC))

HEADER := libasm.h

WHITE = \033[0;37m
RED = \033[0;31m
CYAN = \033[0;36m
GREEN = \033[0;32m
MAGENTA = \033[0;35m

OBJ := $(SRC:%.s=%.o)

MAIN := main.c
TEST := test

SANI 	:= -fsanitize=address -g3

ASM     := nasm
AFLAGS  := -f elf64

CC 		:= gcc
CFLAGS 	:= -Wall -Wextra -Werror

CFLAGS	:= $(CFLAGS) $(EFLAGS)

RM 		:= rm -rf

all : $(NAME)

$(NAME) : $(OBJ) 
	ar rcs $(NAME) $(OBJ)
	@echo "$(GREEN)$(NAME) compiled...$(WHITE)"
	@echo "$(CYAN)$$ASCII_ART$(WHITE)"

%.o: %.s
	$(ASM) $(AFLAGS) $< -o $@

sani:
	$(MAKE) EFLAGS='$(SANI)' all

commit:
	git branch temp
	git checkout temp
	git add $(SRC) $(HEADER) ./Makefile
	git commit -m "commit general"
	git push
	git status

test: all
	$(CC) $(CFLAGS) $(MAIN) $(NAME) -o $(TEST)
	./test

sani_test: all
	$(CC) $(CFLAGS) $(SANI) $(MAIN) $(NAME) -o $(TEST)
	./test

clean : 
		$(RM) $(OBJ)
		@echo "$(RED)clean done...$(WHITE)"

fclean : clean
		$(RM) $(NAME)
		$(RM) $(TEST)
		@echo "$(RED)fclean done...$(WHITE)"

re : fclean all

.PHONY : all clean fclean re sani flagless normi commit test
