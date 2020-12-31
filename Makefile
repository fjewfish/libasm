NAME	= libasm.a
FLAGS	=	-Wall -Werror -Wextra
SRCS	=	*.s

OBJS = $(SRCS:.s=.o)

%.o	: %.s
	nasm -f macho64 $< -o $@

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

all: $(NAME)

clean:
	rm -rf $(OBJS)

test: all
	gcc $(FLAGS) -L. -lasm -o test main.c
	./test

fclean: clean
	rm -rf $(NAME)
	rm -rf try_libasm
	rm -rf test

re: fclean all
