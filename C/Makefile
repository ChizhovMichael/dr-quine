COLLEEN	=	Colleen/Colleen
GRACE	=	Grace/Grace
SULLY	=	Sully/Sully

C_SRCS	=	./Colleen/Colleen.c
G_SRCS	=	./Grace/Grace.c
S_SRCS	=	./Sully/Sully.c

C_OBJS	=	$(C_SRCS:.c=.o)
G_OBJS	=	$(G_SRCS:.c=.o)
S_OBJS	=	$(S_SRCS:.c=.o)

CFLAGS	=	-Wall -Wextra -Werror

.c.o:
		gcc $(CFLAGS) -c $< -o $(<:.c=.o)

all: 		$(COLLEEN) $(GRACE) $(SULLY)

$(COLLEEN):	$(C_OBJS)
		gcc $(C_OBJS) -o $(COLLEEN)

$(GRACE):	$(G_OBJS)
		gcc $(G_OBJS) -o $(GRACE)

$(SULLY):	$(S_OBJS)
		gcc $(S_OBJS) -o $(SULLY)

clean:
		rm -f $(C_OBJS) $(G_OBJS) $(S_OBJS)

fclean:		clean
		rm -f $(COLLEEN) $(GRACE) $(SULLY)

re:		fclean all

.PHONY:		all clean fclean re
