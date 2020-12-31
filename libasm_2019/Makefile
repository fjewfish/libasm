NAME = libasm.a

SRCS =	*.s

OBJS = $(SRCS:.s=.o)

%.o	: %.s
	nasm -f macho64 $< -o $@

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

all: $(NAME)

clean:
	rm -rf $(OBJS)

test: all
	gcc -Wall -Wextra -Werror -I./libasm.h libasm.a main.c -o test
	./try_libasm

fclean: clean
	rm -rf $(NAME)
	rm -rf try_libasm
	rm -rf test

re: fclean all
