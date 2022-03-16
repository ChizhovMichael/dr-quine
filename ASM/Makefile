COLLEEN	=	Colleen/Colleen
GRACE	=	Grace/Grace
SULLY	=	Sully/Sully

C_SRCS	=	./Colleen/Colleen.s
G_SRCS	=	./Grace/Grace.s
S_SRCS	=	./Sully/Sully.s

C_OBJS	=	$(C_SRCS:.s=.o)
G_OBJS	=	$(G_SRCS:.s=.o)
S_OBJS	=	$(S_SRCS:.s=.o)

CFLAGS	=	-f macho64

%.o:		%.s
			nasm $(CFLAGS) $< -o $@

all: 		$(COLLEEN) $(GRACE) $(SULLY)

$(COLLEEN):	$(C_OBJS)

$(GRACE):	$(G_OBJS)

$(SULLY):	$(S_OBJS)

clean:
		rm -f $(C_OBJS) $(G_OBJS) $(S_OBJS)

fclean:		clean
		rm -f $(COLLEEN) $(GRACE) $(SULLY)

re:		fclean all

.PHONY:		all clean fclean re