# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sjones <sjones@student.42.us.org>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/07/03 12:05:37 by sjones            #+#    #+#              #
#    Updated: 2018/01/11 22:44:55 by sjones           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = ft_retro
INCLUDES = -I ./includes
OBJS = $(addprefix ./srcs/, \
					$(addsuffix .o, \
							Game \
							Piece \
							Player \
							Ship \
							Stars \
							Object \
							main \
						) \
				)
CXXFLAGS = -Wall -Werror -Wextra
DEBUG = -g -fno-omit-frame-pointer -fsanitize=address

all: $(NAME)

$(NAME): $(OBJS)
	$(CXX) $(CXXFLAGS) $(OBJS) -o $@ -lncurses

%.o: %.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c -o $@ $<

debug: $(NAME)
	$(CXX) $(CXXFLAGS) $(DEBUG) $(OBJS) -o $@

clean:
	$(RM) -f $(OBJS)

fclean: clean
	$(RM) $(NAME)

re: fclean all
.PHONY:re fclean clean all
